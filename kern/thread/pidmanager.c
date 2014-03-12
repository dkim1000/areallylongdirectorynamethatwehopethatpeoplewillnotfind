/*
 * pidmanager.c
 *
 *  Created on: Mar 11, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#include <kern/unistd.h>
#include <types.h>
#include <curthread.h>
#include <lib.h>
#include <array.h>
#include <queue.h>
#include <pidmanager.h>
#include <processhandler.h>

/*
 * Creates a pidmanager in thread_bootstrap
 */
struct pidmanager *
pidmanager_create()
{
	struct pidmanager *pm = kmalloc(sizeof(struct pidmanager));
	int ret;

	pm->pm_data = array_create();

	pm->pm_queue = q_create(MAX_PROCESSES);
	if (pm->pm_queue == NULL)
	{
		return NULL;
	}
	int i;
	for (i = 0; i < MAX_PROCESSES; i++)
	{
		int *pid = (int*)(kmalloc(sizeof(int)));
		if (pid == NULL)
		{
			return NULL;
		}
		*pid = i;
		ret = q_addtail(pm->pm_queue, (void*)pid);
		if (ret)
		{
			return NULL;
		}
	}
	return pm;
}

/*
 * Returns the processhandler given its pid
 */
struct processhandler *
pidmanager_get(struct pidmanager *pm, pid_t pid)
{
	assert(pm);

	struct processhandler *ph;
	ph = array_getguy(pm->pm_data, (int)pid);

	if (!ph) return NULL;

	return ph;
}

/*
 * Add a processhandler to the pidmanager with a unique pid
 * returns pid of the processhandler or -1 on error
 */
pid_t
pidmanager_add(struct pidmanager *pm, struct processhandler* ph)
{
	assert(pm);
	assert(ph);
	pid_t *pid = (pid_t*)q_remhead(pm->pm_queue);

	if (*pid >= pidmanager_getsize(pm))
	{
		int lookahead;

		for (lookahead = (int)pidmanager_getsize(pm); lookahead < *pid - 1; lookahead++)
		{
			array_add(pm->pm_data, NULL);
		}
		array_add(pm->pm_data, ph);
	}
	else
	{
		array_setguy(pm->pm_data, (int)*pid, ph);
	}
	//kprintf ("TESTING PID: %d\n", *pid);
	return *pid;
}

/*
 * Removes a processhandler from the pidmanager, returns 0 on success, and returns -1 on error
 */
int
pidmanager_remove(struct pidmanager *pm, pid_t pid)
{
	assert(pm);
	struct processhandler *ph = pidmanager_get(pm, pid);
	if (ph != NULL)
	{
		processhandler_destroy(ph);
		array_setguy(pm->pm_data, (int)pid, NULL);
	}
	int ret;
	ret = q_addtail(pm->pm_queue, (void *)pid);
	if (ret)
	{
		return -1;
	}
	return 0;
}

/*
 * Flushes and destroys a pidmanager
 */
void pidmanager_destroy(struct pidmanager *pm)
{
	assert(pm);
	int i;
	struct processhandler *ph;

	for (i = 0; i < pidmanager_getsize(pm); i++)
	{
		ph = pidmanager_get(pm, i);

		if (ph != NULL)
		{
			processhandler_destroy(ph);
		}
	}

	array_destroy(pm->pm_data);

	while (!q_empty(pm->pm_queue)) {
		q_remhead(pm->pm_queue);
	}

	q_destroy(pm->pm_queue);
	kfree(pm);
}

int pidmanager_getsize(struct pidmanager *pm)
{
	return array_getnum(pm->pm_data);
}
