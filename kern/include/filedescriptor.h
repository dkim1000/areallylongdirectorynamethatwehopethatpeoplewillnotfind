/*
 * filedescriptor.h
 *
 *  Created on: Mar 7, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#ifndef FILEDESCRIPTOR_H_
#define FILEDESCRIPTOR_H_

struct filedescriptor
{
	int fd_opened;
	struct vnode *fd_vnode;	// the abstract representation of the file
	int fd_offset;			// the current position in the file
	unsigned int fd_mode;	// one of: O_RDONLY, O_WRONLY, O_RDWR
	struct lock *fd_lock;	// asserts mutual exclusion for file descriptor
};

/*
 * Returns an instance of a file descriptor
 */
struct filedescriptor *
filedescriptor_create(struct vnode *vn, int offset, unsigned int mode, char *lock_name);

/*
 * Cleans up and destroys file descriptor
 */
void
filedescriptor_destroy(struct filedescriptor *fd);

#endif /* FILEDESCRIPTOR_H_ */
