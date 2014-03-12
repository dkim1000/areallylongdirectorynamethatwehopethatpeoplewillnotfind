#ifndef _PT_H_
#define _PT_H_

#include <opt-A3.h>

#if OPT_A3

struct pagetable_entry
{
	vaddr_t vpn;
	paddr_t pfn;

	int modified;
	int used;
	int valid;
	int dirty;
};

struct pagetable
{
	struct pagetable_entry **entries;
};

struct pagetable *pagetable_init();

#endif

#endif
