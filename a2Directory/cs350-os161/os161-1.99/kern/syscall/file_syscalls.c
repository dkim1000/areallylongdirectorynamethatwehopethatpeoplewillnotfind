#include <types.h>
#include <kern/errno.h>
#include <kern/unistd.h>
#include <lib.h>
#include <uio.h>
#include <syscall.h>
#include <vnode.h>
#include <vfs.h>
#include <current.h>
#include <proc.h>

#include <fdManager.h>
#include <filedescriptor.h>
#include <kern/fcntl.h>
#include <thread.h>
#include <synch.h>

/* handler for write() system call                  */
/*
 * n.b.
 * This implementation handles only writes to standard output 
 * and standard error, both of which go to the console.
 * Also, it does not provide any synchronization, so writes
 * are not atomic.
 *
 * You will need to improve this implementation
 */

//int
//sys_write(int fdesc,userptr_t ubuf,unsigned int nbytes,int *retval)
//{
//  struct iovec iov;
//  struct uio u;
//  int res;
//
//  DEBUG(DB_SYSCALL,"Syscall: write(%d,%x,%d)\n",fdesc,(unsigned int)ubuf,nbytes);
//  
//  /* only stdout and stderr writes are currently implemented */
//  if (!((fdesc==STDOUT_FILENO)||(fdesc==STDERR_FILENO))) {
//    return EUNIMP;
//  }
//  KASSERT(curproc != NULL);
//  KASSERT(curproc->console != NULL);
//  KASSERT(curproc->p_addrspace != NULL);
//
//  /* set up a uio structure to refer to the user program's buffer (ubuf) */
//  iov.iov_ubase = ubuf;
//  iov.iov_len = nbytes;
//  u.uio_iov = &iov;
//  u.uio_iovcnt = 1;
//  u.uio_offset = 0;  /* not needed for the console */
//  u.uio_resid = nbytes;
//  u.uio_segflg = UIO_USERSPACE;
//  u.uio_rw = UIO_WRITE;
//  u.uio_space = curproc->p_addrspace;
//
//  res = VOP_WRITE(curproc->console,&u);
//  if (res) {
//    return res;
//  }
//
//  /* pass back the number of bytes actually written */
//  *retval = nbytes - u.uio_resid;
//  KASSERT(*retval >= 0);
//  return 0;
//}

int sys_open(const char* filename, int flags, unsigned int mode){
    (void) mode;
    struct vnode *vNode;
    struct filedescriptor *f_desc;
    int returnval = vfs_open((void*)filename, flags, 0, &vNode);
    if(returnval){
        return (returnval)*(-1);
    }else{
        char nameOfLock[128];
        strcpy(nameOfLock, "lock_");
        strcat(nameOfLock, filename);
        
        f_desc = fdcreate(0,flags , nameOfLock, vNode);
        
        int a;
        a = addDescriptor((curthread->t_fdManager), f_desc);
        return a;
        
        
    }
}

int sys_close(int num){
    
    int returnVal;
    returnVal = removeDescriptor(num, (struct fdManager *)curthread->t_fdManager);
    
    if(returnVal){
        return (-1)*(returnVal);
    }
    return 0;
}

int
sys_read(int fdesc,userptr_t ubuf,unsigned int nbytes,int *retval){


	if (!ubuf){
		return EFAULT;
	}

	struct filedescriptor* fDescriptor = getFileDescriptor(fdesc, curthread->t_fdManager);  
	if (fDescriptor == NULL){
		return EBADF;
	}

	switch (O_ACCMODE & fDescriptor->fdmode){
		case O_RDONLY:
			break;
		case O_RDWR:
			break;
		default:
			return EBADF;
	}

	struct uio u;
	struct iovec iov;
	iov.iov_ubase = ubuf;
  iov.iov_len = nbytes;
  u.uio_iov = &iov;
  u.uio_iovcnt = 1;
  u.uio_offset = fDescriptor->fdoff;  /* not needed for the console */
  u.uio_resid = nbytes;
  u.uio_segflg = UIO_USERSPACE;
  u.uio_rw = UIO_READ;
  u.uio_space = curproc->p_addrspace;

	lock_acquire(fDescriptor->fdlock);
	int readSize = VOP_READ(fDescriptor->fdvnode, &u);
	lock_release(fDescriptor->fdlock);

	if(readSize){
		return readSize;
	}

	readSize = nbytes - u.uio_resid;	  
	*retval = readSize;

	fDescriptor->fdoff += nbytes;



	return nbytes;


}

















int
sys_write(int fdesc,userptr_t ubuf,unsigned int nbytes,int *retval)
{
  struct iovec iov;
  struct uio u;
	struct filedescriptor *fDescriptor;
  int res;
	int bytesWrite;

	if(!ubuf){
		return EFAULT;
	}


	fDescriptor = getFileDescriptor(fdesc, curthread->t_fdManager);
	if(fDescriptor == NULL){
		return EBADF;
	}

  DEBUG(DB_SYSCALL,"Syscall: write(%d,%x,%d)\n",fdesc,(unsigned int)ubuf,nbytes);
  
  /* only stdout and stderr writes are currently implemented */
  if (!((fdesc==STDOUT_FILENO)||(fdesc==STDERR_FILENO))) {
    return EUNIMP;
  }
  KASSERT(curproc != NULL);
  KASSERT(curproc->console != NULL);
  KASSERT(curproc->p_addrspace != NULL);

  /* set up a uio structure to refer to the user program's buffer (ubuf) */
  iov.iov_ubase = ubuf;
  iov.iov_len = nbytes;
  u.uio_iov = &iov;
  u.uio_iovcnt = 1;
  u.uio_offset = fDescriptor->fdoff;  /* not needed for the console */
  u.uio_resid = nbytes;
  u.uio_segflg = UIO_USERSPACE;
  u.uio_rw = UIO_WRITE;
  u.uio_space = curproc->p_addrspace;

	bytesWrite = u.uio_resid;

	lock_acquire(fDescriptor->fdlock);
  res = VOP_WRITE(fDescriptor->fdvnode,&u);
	lock_release(fDescriptor->fdlock);

	bytesWrite = u.uio_resid;
	if(bytesWrite==0){
		return 0;
	}

  if (res) {
    return res;
  }

  /* pass back the number of bytes actually written */
  *retval = nbytes - u.uio_resid;
  KASSERT(*retval >= 0);
	fDescriptor->fdoff += nbytes;

  return 0;
}


