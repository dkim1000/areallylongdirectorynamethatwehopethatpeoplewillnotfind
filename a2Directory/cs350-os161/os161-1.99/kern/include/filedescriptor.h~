#ifndef FILEDESCRIPTOR_H_
#define FILEDESCRIPTOR_H_

struct filedescriptor{
        struct lock *fdlock;
        int fdmode;
        struct vnode *fdvnode;
        int addr;
        int fdoff;
        int fdopen;
};

struct filedescriptor * fdcreate(int off, unsigned int mode, char *nameOfLock, struct vnode *curvnode);

void fddestroy(struct filedescriptor *file);
#endif


