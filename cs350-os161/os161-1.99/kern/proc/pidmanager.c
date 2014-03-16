#include <types.h>
#include <kern/fcntl.h>
#include <array.h>
#include <pidmanager.h>
#include <queue.h>
#include <kern/unistd.h>
#include <proc.h>

struct pidmanager* pidcreate(){
  int val;
  struct pidmanager *pid = kmalloc(sizeof(struct pidmanager));

  pid->pid_data = array_create();
  int start;
  pid->pid_queue = q_create(100);
  if(pid->pid_queue == NULL){ return NULL;}
  while(start != 100){
    int *a = (int*)(kmalloc(sizeof(int)));
    if(a != NULL){
      *a = start;
      val = q_addtail(pid->pid_queue, (void*)a);
      if(val != 0){
	return NULL;
      }

    }else{

      return NULL;
    }
  }
  return pid;


}

struct proc* pidget(struct pidmanager *pid, pid_t pidoff){

  struct proc *pro;
  int f = (int)pidoff;
  pro = array_get(pid->pid_data, f);
  if(pro){
    return pro;
  }else{
    return NULL;
  }
}

pid_t pidadd(struct pidmanager *pid , struct proc* pro){
  pid_t* pidoff = (pid_t*)q_remhead(pid->pid_queue);
  unsigned int *err;
  int h = array_num(pid->pid_data);
  if(*pidoff < h){
    array_set(pid->pid_data, (int)*pidoff, pro);
  }else{
    int q = array_num(pid->pid_data);
    int start = q;
    while(start != *pidoff - 1){
      array_add(pid->pid_data, NULL, err );
      start++;
    }
    array_add(pid->pid_data, pro, err);

  }
  return *pidoff;

}

int pidremove(struct pidmanager *pid, pid_t pidoff){
  struct proc *pro = pidget(pid, pidoff);
  if(pro != NULL){
    proc_destroy(pro);
    array_set(pid->pid_data, (int)pidoff, NULL);
  }
  int f;
  f = q_addtail(pid->pid_queue, (void*)pidoff);
  if(!f){
    return 0;
  }else{
    return -1;
  }

}

void pidclean(struct pidmanager *pid){
  struct proc *pro;
  int h = array_num(pid->pid_data);
  for(int g = 0; g <= h-1; g++) {
      pro = pidget(pid, g );
      if( pro != NULL){ proc_destroy(pro);
  }

}
array_destroy(pid->pid_data);
while(!q_empty(pid->pid_queue)){
  q_remhead(pid->pid_queue);

 }
q_destroy(pid->pid_queue);
kfree(pid);


}

