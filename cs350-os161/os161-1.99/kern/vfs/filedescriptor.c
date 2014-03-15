#include <filedescriptor.h>
#include <types.h>
#include <synch.h>
#include <lib.h>
#include <vfs.h>
#include <kern/unistd.h>

struct filedescriptor *fdcreate(int off, unsigned int mode, char *nameOfLock, struct vnode *curvnode){
	struct filedescriptor *file;
	file = kmalloc(sizeof(struct filedescriptor));

	file->addr = 1;
	file->fdmode = mode;
	file->fdlock = lock_create(nameOfLock);
	file->fdoff = off;
	file->fdvnode = curvnode;
	file->fdopen = 0;
	
	return file;
	


}

void fddestroy(struct filedescriptor *file){


	if(file->fdopen > 1){
	file->fdopen = 0;
	file->addr = 1;
	
	}else if (file->fdopen <= 1){
	file->fdopen = 0; //closed
	vfs_close(file->fdvnode);
	kfree(file);
	file->addr = 0;
	}


}
