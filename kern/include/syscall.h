#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#include <opt-A2.h>

/*
 * Prototypes for IN-KERNEL entry points for system call implementations.
 */
int sys_reboot(int code);

#if OPT_A2
int sys_open		(const char *filename, int flags, unsigned int mode);
int sys_close 		(int fd);
int sys_read 		(int fd, void *buff, size_t buflen);
int sys_write 		(int fd, const void *buff, size_t nbytes);
pid_t sys_fork 		(struct trapframe *tf);
pid_t sys_getpid 	(void);
pid_t sys_waitpid 	(pid_t pid, int *status, int options);
void sys__exit 		(int exitcode);
int sys_execv 		(const char *program, char **args);
#endif

#endif /* _SYSCALL_H_ */
