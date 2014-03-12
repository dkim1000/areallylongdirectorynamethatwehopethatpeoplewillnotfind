#include <opt-A3.h>

#if OPT_A3

#include <types.h>
#include <kern/errno.h>
#include <lib.h>
#include <pt.h>

struct pagetable *pagetable_init()
{
	struct pagetable *pt;

	pt->entries = kmalloc(sizeof(struct pagetable_entry *));

	return pt;
}

#endif
