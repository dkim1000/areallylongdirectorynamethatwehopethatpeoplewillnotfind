#ifndef _FDMANAGER_H_
#define _FDMANAGER_H_

struct fdManager
{
	struct array *fdm_data;		// the handles to the file descriptors
	int fdm_initialized;		// indicates if the file manager has been initialized
	int fdm_next;
};

struct fdManager * make_fdManager();

int initialize_fdManager(struct fdManager *manager);
struct filedescriptor * getFileDescriptor(struct fdManager *manager, int index);
int addDescriptor(struct fdManager *manager, struct filedescriptor *descriptor);
int removeDescriptor(struct fdManager * manager, int index);
struct fdManager * clone(struct fdManager *manager);
int getSize(struct fdManager * manager);
void destroy(struct fdManager * manager);
void print(struct fdManager * manager);

#endif /* _FDMANAGER_H_ */