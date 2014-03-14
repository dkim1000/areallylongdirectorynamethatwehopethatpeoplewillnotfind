/*
 * Copyright (c) 2000, 2001, 2002, 2003, 2004, 2005, 2008, 2009
 *	The President and Fellows of Harvard College.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

/*
 * Sample/test code for running a user program.  You can use this for
 * reference when implementing the execv() system call. Remember though
 * that execv() needs to do more than this function does.
 */

#include <types.h>
#include <kern/errno.h>
#include <kern/fcntl.h>
#include <curthread.h>
#include <thread.h>
#include <uio.h>
#include <lib.h>
#include <proc.h>
#include <current.h>
#include <addrspace.h>
#include <vm.h>
#include <test.h>
#include <vfs.h>
#include <syscall.h>
#include <test.h>
#include "copyinout.h"
#include "opt-A2.h"
/*
 * Load program "progname" and start running it in usermode.
 * Does not return except on error.
 *
 * Calls vfs_open on progname and thus may destroy it.
 */
#if OPT_A2
int
runprogram(int argc, char *args[])
{
        //userptr_t *argv;
	struct addrspace *as;
	struct vnode *v;
	vaddr_t entrypoint, stackptr;
	int result;

        //argv = kmalloc(argc * sizeof(userptr_t) + 1);
	//argv[argc] = NULL;

	//argv[0] =(userptr_t) args[0];

	/* Open the file. */
	result = vfs_open(args[0], O_RDONLY, 0, &v);
	if (result) {
		return result;
	}

	/* We should be a new process. */
	KASSERT(curproc_getas() == NULL);

	/* Create a new address space. */
	as = as_create();
	if (as ==NULL) {
		vfs_close(v);
		return ENOMEM;
	}

	/* Switch to it and activate it. */
	curproc_setas(as);
	as_activate();

	/* Load the executable. */
	result = load_elf(v, &entrypoint);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		vfs_close(v);
		return result;
	}

	/* Done with the file now. */
	vfs_close(v);

	/* Define the user stack in the address space */
	result = as_define_stack(as, &stackptr);
	if (result) {
		/* p_addrspace will go away when curproc is destroyed */
		return result;
	}

	//start
	
	
	int i =0;
	int sizeOfFrame = 8;
	for(; i < argc; i++){
		sizeOfFrame =5  + sizeOfFrame + strlen(args[i]);
	//	argv[i] = (userptr_t) stackptr;
		
	}
	stackptr = stackptr - sizeOfFrame - 4;
	for(stackptr = stackptr; stackptr % 8 > 0; stackptr--){
	//Chris, use a while loop here
	
	}
		
	int position = (int)(4 + ((argc + 1) * 4) + stackptr);
       // copyout((void *) & argc, (userptr_t) stackptr , (size_t) 4);
	
//	copyout(&argv[0], (userptr_t)stackptr, sizeof(userptr_t));
//	 copyoutstr(args[0], (userptr_t) position, (size_t)(strlen(args[0])), NULL);
	
	 copyout((void *) &position, (userptr_t)(4 + stackptr + (-1 * 4)), (size_t) 4);
        copyoutstr(args[-1], (userptr_t) position, (size_t)(strlen(args[-1])), NULL);
        position = position + strlen(args[-1]) + 1;

	for(i = 0; i < argc; i++){
	copyout((void *) &position, (userptr_t)(0 + stackptr + (i * 4)), (size_t) 4);
	copyoutstr(args[i], (userptr_t) position, (size_t)(strlen(args[i])), NULL);
	position = position + strlen(args[i]) + 1;
	
//	copyout(&argv[i+1], (userptr_t)stackptr, sizeof(userptr_t));
	}

//	int *g = NULL;

//	copyout((void *) &g, (userptr_t)( 0 + (4 * i) + stackptr), (size_t) 4);
//

	



	//end
	

	
	/* Warp to user mode. */
	enter_new_process(argc, (userptr_t)stackptr,
			  stackptr, entrypoint);
	
	/* enter_new_process does not return. */
	panic("enter_new_process returned\n");
	return EINVAL;
}
#endif
