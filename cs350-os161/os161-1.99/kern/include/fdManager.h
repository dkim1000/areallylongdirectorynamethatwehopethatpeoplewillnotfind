#ifndef _FDMANAGER_H_
#define _FDMANAGER_H_

struct fdManager
{
	struct array *fdm_descriptors;		// the handles to the file descriptors
	int fdm_initialized;		// indicates if the file manager has been initialized
	int fdm_next;
};

struct fdManager * make_fdManager(void);

int initialize_fdManager(struct fdManager * manager);
struct filedescriptor * getFileDescriptor(int index,struct fdManager *manager);
int addDescriptor(struct fdManager *manager, struct filedescriptor *descriptor);
int removeDescriptor(int index,struct fdManager * manager);
struct fdManager * clone(struct fdManager *manager);
int getSize(struct fdManager * manager);
void destroy(struct fdManager * manager);
void print(struct fdManager * manager);

#endif /* _FDMANAGER_H_ */

