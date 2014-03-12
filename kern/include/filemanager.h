/*
 * filemanager.h
 *
 *  Created on: Mar 7, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */
#ifndef FILEMANAGER_H_
#define FILEMANAGER_H_

#define MAX_NUM_FILES 100

struct filemanager
{
	struct array *fm_data;		// the handles to the file descriptors
	int fm_initialized;		// indicates if the file manager has been initialized
	int fm_next;
};

/*
 * Creates a filemanager for the current thread
 */
struct filemanager *
filemanager_create();

/*
 * Creates the default standard files: STDIN, STDOUT, STDERR
 * if not already created.
 */
int
filemanager_init(struct filemanager *fm);

/*
 * Returns the file descriptor keyed by fd_index
 */
struct filedescriptor *
filemanager_get(struct filemanager *fm, int fd_index);

/*
 * Gets the number of filemanager entries
 */
int
filemanager_getsize(struct filemanager *fm);

/*
 * Returns the position of the file descriptor in the file table.
 */
int
filemanager_add(struct filemanager *fm, struct filedescriptor *fd);

/*
 * Removes a filedescriptor from the filemanager
 */
int
filemanager_remove(struct filemanager *fm, int index);

/*
 * Returns a copy of the filemanager provided
 */
struct filemanager *
filemanager_clone(struct filemanager *fm);

/*
 * Flushes and destroys the filemanager
 */
void
filemanager_destroy(struct filemanager *fm);

/*
 * Prints out used state of the filemanager entries
 */
void
filemanager_print(struct filemanager *fm);

#endif /* FILEMANAGER_H_ */
