/*
 * filemanager.c
 *
 *  Created on: Mar 7, 2012
 *      Author: BE GENEROUS WHEN MARKING
 */

#include <kern/unistd.h>
#include <types.h>
#include <curthread.h>
#include <lib.h>
#include <array.h>
#include <vfs.h>
#include <synch.h>
#include <filedescriptor.h>
#include <filemanager.h>
#include <queue.h>
#include <thread.h>
#include <machine/spl.h>

struct filemanager *
filemanager_create()
{
	struct filemanager *fm;

	fm = kmalloc(sizeof(struct filemanager));
	if (fm == NULL)
	{
		return NULL;
	}
	fm->fm_data = array_create();
	if (fm->fm_data == NULL)
	{
		kfree (fm);
		return NULL;
	}
	fm->fm_initialized = 0;
	fm->fm_next = 0;

	return fm;
}

// initializing the filemanager to have the initial 3 STDIO
int
filemanager_init(struct filemanager *fm)
{
	if (fm->fm_initialized == 1)
	{
		return -1;
	}

	assert(fm);

	struct vnode *v;
	int result;
	char *str_con = kmalloc(sizeof (char) * 4);

	struct filedescriptor *fd_stdin;
	struct filedescriptor *fd_stdout;
	struct filedescriptor *fd_stderr;

	fd_stdin = kmalloc(sizeof(struct filedescriptor));
	fd_stdout = kmalloc(sizeof(struct filedescriptor));
	fd_stderr = kmalloc(sizeof(struct filedescriptor));

	// STDIN
	strcpy(str_con, "con:");
	result = vfs_open(str_con, O_RDONLY, &v);
	if (result)
	{
		kprintf("Failed to open STDIN: %s\n", strerror(result));
		vfs_close(v);
		filemanager_destroy(fm);
		return -1;
	}
	fd_stdin = filedescriptor_create(v, 0, O_RDONLY, (char *)("lock_stdin"));

	// STDOUT
	strcpy(str_con, "con:");
	result = vfs_open(str_con, O_WRONLY, &v);
	if (result)
	{
		kprintf("Failed to open STDOUT: %s\n", strerror(result));
		vfs_close(v);
		filemanager_destroy(fm);
		return -1;
	}
	fd_stdout = filedescriptor_create(v, 0, O_WRONLY, (char *)("lock_stdout"));

	// STDERR
	strcpy(str_con, "con:");
	result = vfs_open(str_con, O_WRONLY, &v);
	if (result)
	{
		kprintf("Failed to open STDERR: %s\n", strerror(result));
		vfs_close(v);
		filemanager_destroy(fm);
		return -1;
	}
	fd_stderr = filedescriptor_create(v, 0, O_WRONLY, (char *)("lock_stderr"));

	if (fm->fm_initialized == 0)
	{
		fm->fm_initialized = 1;
	}

	kfree(str_con);

	filemanager_add(fm, fd_stdin);
	filemanager_add(fm, fd_stdout);
	filemanager_add(fm, fd_stderr);

	return 0;
}

struct filedescriptor *
filemanager_get(struct filemanager *fm, int fd_index)
{
	assert(fm);
	if (fm->fm_initialized == 0)
	{
		filemanager_init(fm);
	}
	assert(fm->fm_initialized == 1);
    
	struct filedescriptor *fd;
	if (fd_index >= filemanager_getsize(fm))
	{
		return NULL;
	}
    fd = array_getguy(fm->fm_data, fd_index);

    if (fd == NULL)
    {
    	//filemanager_remove (fm, fd_index);
    	return NULL;
    }
	return fd;
}

int
filemanager_add(struct filemanager *fm, struct filedescriptor *fd)
{
	assert(fm);
	if (fm->fm_initialized == 0)
	{
		filemanager_init(fm);
	}
	assert(fm->fm_initialized == 1);

	int retval;

	if (fm->fm_next < filemanager_getsize(fm))
	{
		array_setguy(fm->fm_data, fm->fm_next, (void *) fd);
		retval = fm->fm_next;
		int size = filemanager_getsize(fm);
		int i;
		for (i = fm->fm_next; i < size; i++)
		{
			if (!filemanager_get(fm, i))
			{
				fm->fm_next = i;
				break;
			}
			fm->fm_next = i+1;
		}

		fd->fd_opened += 1;
	}
	else
	{
		if (array_add(fm->fm_data, (void *) fd))
		{
			return -1;
		}
		retval = fm->fm_next;
		fm->fm_next = filemanager_getsize(fm);

		fd->fd_opened += 1;
	}

	return retval;
}

int
filemanager_remove(struct filemanager *fm, int index)
{
	assert(fm);
	assert (index >= 0 && index < filemanager_getsize(fm));

	struct filedescriptor *fd = filemanager_get(fm, index);
	if (fd == NULL)
	{
		return -1;
	}
	filedescriptor_destroy(fd);
	array_setguy(fm->fm_data, index, NULL);
	if (index < fm->fm_next)
	{
		fm->fm_next = index;
	}
	return 0;
/*
	struct filedescriptor *fd = filemanager_get(fm, index);
	array_setguy(fm->fm_data, index, NULL);

	if (fd != NULL)
	{
		filedescriptor_destroy(fd);
	}

	return 0;
	*/
}

struct filemanager *
filemanager_clone(struct filemanager *fm)
{
	assert(fm);
	if (fm->fm_initialized == 0)
	{
		filemanager_init(fm);
	}
	assert(fm->fm_initialized == 1);

    //struct filemanager *fm_clone;
	struct filemanager *fm_clone;
	fm_clone = filemanager_create();

    if (fm_clone == NULL)
    {
    	return NULL;
    }

    int size;
    size = filemanager_getsize(fm);
    //kprintf ("size: %d\n", size);

    fm_clone->fm_initialized = 1;
    int index;
    for (index = 0; index < size; index++)
    {
    	//kprintf ("index of cloning fd: %d\n", index);
    	//lock_acquire(fd->fd_lock);
    	fm_clone->fm_next = index;
    	filemanager_add(fm_clone, filemanager_get(fm, index));
    	//lock_release(fd->fd_lock);
    }
    fm_clone->fm_next = fm->fm_next;

    return fm_clone;
}

int
filemanager_getsize(struct filemanager *fm)
{
	assert(fm);
    return array_getnum(fm->fm_data);
}

void
filemanager_destroy(struct filemanager *fm)
{
	assert(fm);
    int i;
    int size = filemanager_getsize(fm);
    //filemanager_print (fm);
    for (i = 0; i < size; i++)
	{
		filemanager_remove(fm, i);
	}

    assert(fm->fm_data);
	array_destroy(fm->fm_data);

	kfree(fm);
}

void 
filemanager_print(struct filemanager *fm)
{
    int i;
    kprintf("pid %d:\t", (int)curthread->t_pid);
    for (i = 0; i<filemanager_getsize(fm); i++)
    {
        if (filemanager_get(fm, i) == NULL) kprintf("X");
        else kprintf("%d", i);
    }
    kprintf("\n");
}
