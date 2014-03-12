/*
 * pidmanager.h
 *
 *  Created on: Mar 11, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */
#ifndef PIDMANAGER_H_
#define PIDMANAGER_H_

#define MAX_PROCESSES 100

struct pidmanager
{
	struct array *pm_data;
    struct queue *pm_queue;
};

/*
 * Creates a pidmanager in thread_bootstrap
 */
struct pidmanager *
pidmanager_create();

/*
 * Returns the processhandler given its pid
 */
struct processhandler *
pidmanager_get(struct pidmanager *pm, pid_t pid);

/*
 * Add a processhandler to the pidmanager with a unique pid
 * returns pid of the processhandler or -1 on error
 */
pid_t
pidmanager_add(struct pidmanager *pm, struct processhandler* ph);

/*
 * Gets number of active pids in pidmgr
 */
int
pidmanager_getsize(struct pidmanager *pm);

/*
 * Removes a processhandler from the pidmanager, returns 0 on success, and returns -1 on error
 */
int
pidmanager_remove(struct pidmanager *pm, pid_t pid);

/*
 * Gets number of processes
 */
int
pidmanager_getsize(struct pidmanager *pm);

/*
 * Flushes and destroys a pidmanager
 */
void pidmanager_destroy(struct pidmanager *pm);

#endif /* PIDMANAGER_H_ */
