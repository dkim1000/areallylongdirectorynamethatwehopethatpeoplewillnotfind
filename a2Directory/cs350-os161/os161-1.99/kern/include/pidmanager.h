#ifndef PIDMANAGER_H_
#define PIDMANAGER_H_

struct pidmanager{
  struct array *pid_data;
  struct queue *pid_queue;

};
struct pidmanager *pidcreate(void);

struct proc *pidget(struct pidmanager *pid, pid_t pidoff);

int pidremove(struct pidmanager *pid, pid_t pidoff);


pid_t pidadd(struct pidmanager *pm, struct proc* pro);


void pidclean(struct pidmanager *pid);

#endif

