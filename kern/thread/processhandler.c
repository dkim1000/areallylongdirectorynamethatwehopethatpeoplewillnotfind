/*
 * processhandler.c
 *
 *  Created on: Mar 11, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#include <types.h>
#include <synch.h>
#include <thread.h>
#include <processhandler.h>
#include <kern/unistd.h>
#include <lib.h>

struct processhandler *
processhandler_create(struct thread *thrd)
{
	struct processhandler *ph;

	ph = kmalloc(sizeof(struct processhandler));
    
	ph->ph_thread = thrd;
	ph->ph_status = PH_NOT_EXITED; // created process
	ph->ph_exitcode = 0; // initialize exit code
	
	//struct processhandler *ph_parent; // the processhandler for the parent

	ph->ph_exitcv = cv_create ("ph_exitcv");
	ph->ph_exitlock = lock_create ("ph_exitlock");

	return ph;
}

void
processhandler_destroy(struct processhandler *ph) {
    assert(ph);
    ph->ph_status = PH_EXITED; //status code for destroyed thread
    cv_destroy(ph->ph_exitcv);
    lock_destroy(ph->ph_exitlock);
    //kfree(ph);
}
