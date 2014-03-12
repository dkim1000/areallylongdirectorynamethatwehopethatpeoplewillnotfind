/*
 * Sample/test code for running a user program.  You can use this for
 * reference when implementing the execv() system call. Remember though
 * that execv() needs to do more than this function does.
 */

#include <types.h>
#include <kern/unistd.h>
#include <kern/errno.h>
#include <lib.h>
#include <addrspace.h>
#include <thread.h>
#include <curthread.h>
#include <vm.h>
#include <vfs.h>
#include <test.h>
#include <uio.h>

void
move_stackptr(int offset, vaddr_t *stackptr)
{
    *stackptr = *stackptr - offset;
}

void
store_program_arguments(int argc, char **args, vaddr_t *stackptr)
{
	userptr_t *argv;
	int arglen, offset, index;

	argv = kmalloc(argc * sizeof(userptr_t) + 1);
	argv[argc] = NULL;

	// store strings in user stack
	for (index = argc - 1; index >= 0; index--)
	{
		arglen = strlen(args[index]) + 1;

		// determine stack offset
		offset = (arglen % 4 != 0)
			? arglen + (4 - arglen % 4)
			: arglen;

		// offset stack pointer
		move_stackptr(offset, stackptr);

		// cache stack pointer in arguments array
		argv[index] = (userptr_t)*stackptr;

		// copy out contents to the user stack
		copyoutstr(args[index], (userptr_t)*stackptr, arglen, NULL);
	}

	// store argument address mappings to user stack
	for (index = argc; index >= 0; index--)
	{
		// offset stack pointer
		move_stackptr(sizeof(userptr_t), stackptr);

		// copy out contents to user stack
		copyout(&argv[index], (userptr_t)*stackptr, sizeof(userptr_t));
	}
}

/*
 * Load program "progname" and start running it in usermode.
 * Does not return except on error.
 *
 * Calls vfs_open on progname and thus may destroy it.
 */
int
runprogram(int argc, char *args[])
{
    struct vnode *v;
	vaddr_t entrypoint, stackptr;
	int result;

    /* Open the file. */
	result = vfs_open(args[0], O_RDONLY, &v);
	if (result) {
		return result;
	}

	/* We should be a new thread. */
	assert(curthread->t_vmspace == NULL);

	/* Create a new address space. */
	curthread->t_vmspace = as_create();
	if (curthread->t_vmspace==NULL) {
		vfs_close(v);
		return ENOMEM;
	}

	/* Activate it. */
	as_activate(curthread->t_vmspace);

	/* Load the executable. */
	result = load_elf(v, &entrypoint);
    
	if (result) {
		/* thread_exit destroys curthread->t_vmspace */
		vfs_close(v);
		return result;
	}

	/* Done with the file now. */
	vfs_close(v);

    /* Define the user stack in the address space */
	result = as_define_stack(curthread->t_vmspace, &stackptr);
	if (result) 
    {
		/* thread_exit destroys curthread->t_vmspace */
		return result;
	}

	// store arguments onto the user stack
	store_program_arguments(argc, args, &stackptr);

	/* Warp to user mode. */
	md_usermode(argc, (userptr_t)stackptr, stackptr, entrypoint);

	/* md_usermode does not return */
	panic("md_usermode returned\n");
    
	return EINVAL;
}

