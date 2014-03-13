#include <types.h>
#include <kern/errno.h>
#include <lib.h>
#include <thread.h>
#include <curthread.h>
#include <addrspace.h>
#include <vm.h>
#include <machine/spl.h>
#include <machine/tlb.h>
#include <opt-A3.h>

#if OPT_A3

#include <uio.h>
#include <elf.h>
#include <uw-vmstats.h>

void
vm_bootstrap(void)
{
	/* Do nothing. */
}

static
paddr_t
getppages(unsigned long npages)
{
	int spl;
	paddr_t addr;

	spl = splhigh();

	addr = ram_stealmem(npages);

	splx(spl);
	return addr;
}

/* Allocate/free some kernel-space virtual pages */
vaddr_t
alloc_kpages(int npages)
{
	paddr_t pa;

	pa = getppages(npages);

	if (pa==0) {
		return 0;
	}
	return PADDR_TO_KVADDR(pa);
}

void
free_kpages(vaddr_t addr)
{
	/* nothing */

	(void)addr;
}

static int
tlb_get_rr_victim()
{
	int victim;
	static unsigned int next_victim = 0;

	victim = next_victim;
	next_victim = (next_victim + 1) % NUM_TLB;
	return victim;
}

int
vm_fault(int faulttype, vaddr_t faultaddress)
{
	vaddr_t vbase1, vtop1, vbase2, vtop2, stackbase, stacktop;
	paddr_t paddr;
	int i;
	u_int32_t ehi, elo;
	struct addrspace *as;
	int spl;

	spl = splhigh();

	faultaddress &= PAGE_FRAME;

	DEBUG(DB_VM, "vm: fault: 0x%x\n", faultaddress);

	switch (faulttype) {
	    case VM_FAULT_READONLY:
			/* We always create pages read-write, so we can't get this */
			splx(spl);
	    	return EFAULT;
	    	//panic("vm: got VM_FAULT_READONLY\n");

	    case VM_FAULT_READ:
	    case VM_FAULT_WRITE:
	    	break;
	    default:
			splx(spl);
			return EINVAL;
	}

	as = curthread->t_vmspace;
	if (as == NULL) {
		/*
		 * No address space set up. This is probably a kernel
		 * fault early in boot. Return EFAULT so as to panic
		 * instead of getting into an infinite faulting loop.
		 */
		return EFAULT;
	}

	/* Assert that the address space has been set up properly. */
	assert(as->as_vbase1 != 0);
	assert(as->as_pbase1 != 0);
	assert(as->as_npages1 != 0);
	assert(as->as_vbase2 != 0);
	assert(as->as_pbase2 != 0);
	assert(as->as_npages2 != 0);
	assert(as->as_stackpbase != 0);
	assert((as->as_vbase1 & PAGE_FRAME) == as->as_vbase1);
	assert((as->as_pbase1 & PAGE_FRAME) == as->as_pbase1);
	assert((as->as_vbase2 & PAGE_FRAME) == as->as_vbase2);
	assert((as->as_pbase2 & PAGE_FRAME) == as->as_pbase2);
	assert((as->as_stackpbase & PAGE_FRAME) == as->as_stackpbase);

	vbase1 = as->as_vbase1;
	vtop1 = vbase1 + as->as_npages1 * PAGE_SIZE;
	vbase2 = as->as_vbase2;
	vtop2 = vbase2 + as->as_npages2 * PAGE_SIZE;
	stackbase = USERSTACK - VM_STACKPAGES * PAGE_SIZE;
	stacktop = USERSTACK;

	if 		(faultaddress >= vbase1 && faultaddress < vtop1) 		{paddr = (faultaddress - vbase1) + as->as_pbase1;}
	else if (faultaddress >= vbase2 && faultaddress < vtop2) 		{paddr = (faultaddress - vbase2) + as->as_pbase2;}
	else if (faultaddress >= stackbase && faultaddress < stacktop) 	{paddr = (faultaddress - stackbase) + as->as_stackpbase;}
	else 															{splx(spl); return EFAULT;}

	/* make sure it's page-aligned */
	assert((paddr & PAGE_FRAME)==paddr);

	vmstats_inc(VMSTAT_TLB_FAULT);

	for (i=0; i<NUM_TLB; i++) {
		TLB_Read(&ehi, &elo, i);

		if (elo & TLBLO_VALID) {
			continue;
		}

		ehi = faultaddress;
		elo = /*(faultaddress >= vtop1 && faultaddress < vbase2)
			? paddr | TLBLO_VALID
			: */paddr | TLBLO_VALID | TLBLO_DIRTY;

		DEBUG(DB_VM, "vm: 0x%x -> 0x%x\n", faultaddress, paddr);
		TLB_Write(ehi, elo, i);

		vmstats_inc(VMSTAT_TLB_FAULT_FREE);

		splx(spl);
		return 0;
	}

	// get next victim to evict
	int evict = tlb_get_rr_victim();

	ehi = faultaddress;
	elo = /*(faultaddress >= vtop1 && faultaddress < vbase2)
		? paddr | TLBLO_VALID
		: */paddr | TLBLO_VALID | TLBLO_DIRTY;

	DEBUG(DB_VM, "vm: 0x%x -> 0x%x\n", faultaddress, paddr);

	TLB_Write(ehi, elo, evict);

	vmstats_inc(VMSTAT_TLB_FAULT_REPLACE);

	splx(spl);

	return 0;
}

struct addrspace *
as_create(void)
{
	struct addrspace *as = kmalloc(sizeof(struct addrspace));

	if (as==NULL) {
		return NULL;
	}

	as->as_vbase1 		= 0;
	as->as_pbase1 		= 0;
	as->as_npages1 		= 0;
	as->as_vbase2 		= 0;
	as->as_pbase2 		= 0;
	as->as_npages2 		= 0;
	as->as_stackpbase 	= 0;

	return as;
}

int
as_copy(struct addrspace *old, struct addrspace **ret)
{
	struct addrspace *new;

	new = as_create();
	if (new==NULL) {
		return ENOMEM;
	}

	new->as_vbase1 = old->as_vbase1;
	new->as_npages1 = old->as_npages1;
	new->as_vbase2 = old->as_vbase2;
	new->as_npages2 = old->as_npages2;

	if (as_prepare_load(new)) {
		as_destroy(new);
		return ENOMEM;
	}

	assert(new->as_pbase1 != 0);
	assert(new->as_pbase2 != 0);
	assert(new->as_stackpbase != 0);

	memmove(
		(void *)PADDR_TO_KVADDR(new->as_pbase1),
		(const void *)PADDR_TO_KVADDR(old->as_pbase1),
		old->as_npages1*PAGE_SIZE);

	memmove(
		(void *)PADDR_TO_KVADDR(new->as_pbase2),
		(const void *)PADDR_TO_KVADDR(old->as_pbase2),
		old->as_npages2*PAGE_SIZE);

	memmove(
		(void *)PADDR_TO_KVADDR(new->as_stackpbase),
		(const void *)PADDR_TO_KVADDR(old->as_stackpbase),
		VM_STACKPAGES*PAGE_SIZE);

	*ret = new;
	return 0;
}

void
as_destroy(struct addrspace *as)
{
	// invalidate TLB
	int spl = splhigh();
	int i;
	for (i=0; i<NUM_TLB; i++) {
		TLB_Write(TLBHI_INVALID(i), TLBLO_INVALID(	), i);
	}
	splx(spl);

	vmstats_inc(VMSTAT_TLB_INVALIDATE);

	kfree(as);
}

void
as_activate(struct addrspace *as)
{
	int i, spl;

	(void)as;

	spl = splhigh();

	for (i=0; i<NUM_TLB; i++) {
		TLB_Write(TLBHI_INVALID(i), TLBLO_INVALID(), i);
	}

	splx(spl);
}

/*
 * Set up a segment at virtual address VADDR of size MEMSIZE. The
 * segment in memory extends from VADDR up to (but not including)
 * VADDR+MEMSIZE.
 *
 * The READABLE, WRITEABLE, and EXECUTABLE flags are set if read,
 * write, or execute permission should be set on the segment. At the
 * moment, these are ignored. When you write the VM system, you may
 * want to implement them.
 */
int
as_define_region(struct addrspace *as, vaddr_t vaddr, size_t sz,
		 int readable, int writeable, int executable)
{
	size_t npages;

	/* Align the region. First, the base... */
	sz += vaddr & ~(vaddr_t)PAGE_FRAME;
	vaddr &= PAGE_FRAME;

	/* ...and now the length. */
	sz = (sz + PAGE_SIZE - 1) & PAGE_FRAME;

	npages = sz / PAGE_SIZE;

	/* We don't use these - all pages are read-write */
	(void)readable;
	(void)writeable;
	(void)executable;

	if (as->as_vbase1 == 0) {
		as->as_vbase1 = vaddr;
		as->as_npages1 = npages;
		return 0;
	}

	if (as->as_vbase2 == 0) {
		as->as_vbase2 = vaddr;
		as->as_npages2 = npages;
		return 0;
	}

	/*
	 * Support for more than two regions is not available.
	 */
	kprintf("vm: Warning: too many regions\n");
	return EUNIMP;
}

int
as_prepare_load(struct addrspace *as)
{
	assert(as->as_pbase1 == 0);
	assert(as->as_pbase2 == 0);
	assert(as->as_stackpbase == 0);

	as->as_pbase1 = getppages(as->as_npages1);
	if (as->as_pbase1 == 0) {
		return ENOMEM;
	}

	as->as_pbase2 = getppages(as->as_npages2);
	if (as->as_pbase2 == 0) {
		return ENOMEM;
	}

	as->as_stackpbase = getppages(VM_STACKPAGES);
	if (as->as_stackpbase == 0) {
		return ENOMEM;
	}
	return 0;
}

int
as_complete_load(struct addrspace *as)
{
	(void)as;
	return 0;
}

int
as_define_stack(struct addrspace *as, vaddr_t *stackptr)
{
	assert(as->as_stackpbase != 0);

	*stackptr = USERSTACK;
	return 0;
}

#endif