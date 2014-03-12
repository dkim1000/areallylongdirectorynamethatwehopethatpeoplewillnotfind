/*
 * filedescriptor.c
 *
 *  Created on: Mar 7, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#include <filedescriptor.h>
#include <kern/unistd.h>
#include <types.h>
#include <synch.h>
#include <lib.h>
#include <vfs.h>

struct filedescriptor *
filedescriptor_create(struct vnode *vn, int offset, unsigned int mode, char *lock_name)
{
	struct filedescriptor *fd;

	fd = kmalloc(sizeof(struct filedescriptor));

	fd->fd_opened = 0;
	fd->fd_vnode = vn;
	fd->fd_offset = offset;
	fd->fd_mode = mode;
	fd->fd_lock = lock_create(lock_name);

	assert(fd->fd_lock);

	return fd;
}

void
filedescriptor_destroy(struct filedescriptor *fd)
{
    assert(fd);
	assert(fd->fd_vnode);
	//lock_acquire(fd->fd_lock);
	if (fd->fd_opened <= 1)
	{
		fd->fd_opened = 0;
		vfs_close(fd->fd_vnode);
		kfree(fd);
	}
	else
	{
		fd->fd_opened -= 1;
	}
	//lock_release(fd->fd_lock);
    //kfree(fd);
}
