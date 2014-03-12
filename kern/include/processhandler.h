/*
 * processhandler.h
 *
 *  Created on: Mar 11, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#ifndef PROCESSHANDLER_H_
#define PROCESSHANDLER_H_

#define PH_EXITED 0
#define PH_NOT_EXITED 1

struct processhandler
{
	struct thread *ph_thread;	// the thread that pidmanager points to using pid
	// struct processhandler *ph_parent; // the processhandler for the parent
	struct cv *ph_exitcv; 		// condition variable for checking for exit
	struct lock *ph_exitlock; 	// lock to sleep on when waiting
	int ph_status;              // the status of the thread
	int ph_exitcode;            // the exit code of the thread
};

struct processhandler *
processhandler_create(struct thread *thrd);

void
processhandler_destroy(struct processhandler *ph);

#endif /* PROCESSHANDLER_H_ */
