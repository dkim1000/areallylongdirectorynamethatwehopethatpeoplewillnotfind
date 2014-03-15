
// fdManager.c

#include <types.h>
#include <kern/fcntl.h>
#include <array.h>
#include <vfs.h>
#include <filedescriptor.h>
#include <fdManager.h>

struct fdManager * make_fdManager() {
	struct fdManager *manager;

	manager = kmalloc(sizeof(struct fdManager));

	if (manager == NULL) {
		return NULL;
	}
	
	manager->fdm_descriptors = array_create();	
	if (manager->fdm_descriptors == NULL)
	{
		kfree(manager);
		return NULL;
	}

	manager->fdm_initialized = 0;
	manager->fdm_next = 0;

	return manager;
}

int initialize_fdManager(struct fdManager *manager) {
	
	if(manager->fdm_initialized == 1) {
		return -1;
	}

	struct vnode *node;
	int error;
	char *console_name = (char*)"con:";
	
	struct filedescriptor *stdin = kmalloc(sizeof(struct filedescriptor));
	struct filedescriptor *stdout = kmalloc(sizeof(struct filedescriptor));
	struct filedescriptor *stderr = kmalloc(sizeof(struct filedescriptor));

	//stdin
	error = vfs_open(console_name, O_RDONLY, 0, &node);
	if (error) {
		kprintf("STDIN open failed: %s\n", strerror(error));
		vfs_close(node);
		destroy(manager);
		return -1;
	}
	stdin = fdcreate(0, O_RDONLY, (char *)("jmok_lok_stdin"), node);
	
	//stdout
	error = vfs_open(console_name, O_WRONLY, 0, &node);
	if (error) {
	        kprintf("STDOUT open failed: %s\n", strerror(error));
		vfs_close(node);
		destroy(manager);
		return -1;
	}
	stdout = fdcreate(0, O_RDONLY, (char *)("jmok_lok_stdout"), node);
	
	//stderr
	error = vfs_open(console_name, O_WRONLY, 0, &node);
	if (error) {
      	        kprintf("STDERR open failed: %s\n", strerror(error));
		vfs_close(node);
		destroy(manager);
		return -1;
	}
	stderr = fdcreate(0, O_RDONLY, (char *)("jmok_lok_stderr"), node);

	if (manager->fdm_initialized == 0) {
		manager->fdm_initialized = 1;
	}

	addDescriptor(manager, stdin);
	addDescriptor(manager, stdout);
	addDescriptor(manager, stderr);

	return 0;
}

struct filedescriptor * getFileDescriptor(struct fdManager *manager, int index) {
	
	if(manager->fdm_initialized == 0) {
		initialize_fdManager(manager);
	}
	
	struct filedescriptor *descriptor;
	if(index >= getSize(manager)) {
		return NULL;
	}

	descriptor = array_get(manager->fdm_descriptors, index);

	return descriptor;
}

int addDescriptor(struct fdManager *manager, struct filedescriptor *descriptor) {
	
        if(manager->fdm_initialized == 0) {
	  initialize_fdManager(manager);
        }

	int mokval;

	if(manager->fdm_next < getSize(manager)) {
		array_set(manager->fdm_descriptors, manager->fdm_next, (void *) descriptor);
		mokval = manager->fdm_next;
		int size = getSize(manager);
		
		int i;
		for(i = manager->fdm_next; i < size; i++) {
			if(!getFileDescriptor(manager, i)) {
				manager->fdm_next = i;
				break;
			}
			manager->fdm_next = i + 1;
		}
		
		descriptor->fdopen = descriptor->fdopen + 1;
	}
	else {
	        unsigned int *error;
		array_add(manager->fdm_descriptors, (void *) descriptor, error);
		if(error) {
			return -1;
		}
		mokval = manager->fdm_next;
		manager->fdm_next = getSize(manager);

		descriptor->fdopen = descriptor->fdopen + 1;
	}
	
	return mokval;

}

int removeDescriptor(struct fdManager * manager, int index){
	struct filedescriptor * descriptor = getFileDescriptor(manager,index);
	if (descriptor == NULL) {
		return -1;
	}
	
	fddestroy(descriptor);
	array_set(manager->fdm_descriptors, index, NULL);
	if (index < manager->fdm_next) {
		manager->fdm_next = index;
	}
	return 0;
}

struct fdManager * clone(struct fdManager *manager) {
	
	struct fdManager *clone;
	clone = make_fdManager();

	if(clone == NULL) {
		return NULL;
	}
	
	int size;
	size = getSize(manager);
	
	clone->fdm_initialized = 1;
	
	for(int i = 0; i < size; i++) {
		clone->fdm_next = i;
		addDescriptor(clone, getFileDescriptor(manager, i));
	}
	clone->fdm_next = manager->fdm_next;

	return clone;
}

int getSize(struct fdManager * manager){
	return array_num(manager->fdm_descriptors);
} 

void destroy(struct fdManager * manager){
	int i;
	int size = getSize(manager);
	
	for(i = 0 ; i < size; i++){
		removeDescriptor(manager,i);
	}

	array_destroy(manager->fdm_descriptors);
	kfree(manager);
}

/*
void print(struct fdManager * manager){
	int i;
	kprintf("pid %d:\t", (int)curthread->t_pid);
	for(i = 0 ; i < getSize(manager); i++){
		if (getDescriptor(manager,i) == NULL)
			kprintf("X");
		else
			kprintf("%d",i);
	}
	kprintf("\n");
}
*/
