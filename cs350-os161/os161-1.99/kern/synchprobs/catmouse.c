/*
 * Catmouse.c
 *
 * 30-1-2003 : GWA : Stub functions created for CS161 Asst1.
 * 26-11-2007: KMS : Modified to use cat_eat and mouse_eat
 * 21-04-2009: KMS : modified to use cat_sleep and mouse_sleep
 * 21-04-2009: KMS : added sem_destroy of CatMouseWait
 * 05-01-2012: TBB : added comments to try to clarify use/non use of volatile
 * 22-08-2013: TBB: made cat and mouse eating and sleeping time optional parameters
 *
 */


/*
 * 
 * Includes
 *
 */

#include <types.h>
#include <lib.h>
#include <test.h>
#include <thread.h>
#include <synch.h>
#include <synchprobs.h>

/*
 * 
 * cat,mouse,bowl simulation functions defined in bowls.c
 *
 * For Assignment 1, you should use these functions to
 *  make your cats and mice eat from the bowls.
 * 
 * You may *not* modify these functions in any way.
 * They are implemented in a separate file (bowls.c) to remind
 * you that you should not change them.
 *
 * For information about the behaviour and return values
 *  of these functions, see bowls.c
 *
 */

/* this must be called before any calls to cat_eat or mouse_eat */
extern int initialize_bowls(unsigned int bowlcount);

extern void cleanup_bowls( void );
extern void cat_eat(unsigned int bowlnumber, int eat_time );
extern void mouse_eat(unsigned int bowlnumber, int eat_time);
extern void cat_sleep(int sleep_time);
extern void mouse_sleep(int sleep_time);

/*
 *
 * Problem parameters
 *
 * Values for these parameters are set by the main driver
 *  function, catmouse(), based on the problem parameters
 *  that are passed in from the kernel menu command or
 *  kernel command line.
 *
 * Once they have been set, you probably shouldn't be
 *  changing them.
 *
 * These are only ever modified by one thread, at creation time,
 * so they do not need to be volatile.
 */
int NumBowls;  // number of food bowls
int NumCats;   // number of cats
int NumMice;   // number of mice
int NumLoops;  // number of times each cat and mouse should eat

/* 
 * Defaults here are as they were with the previos implementation
 * where these could not be changed.
 */
int CatEatTime = 1;      // length of time a cat spends eating
int CatSleepTime = 5;    // length of time a cat spends sleeping
int MouseEatTime = 3;    // length of time a mouse spends eating
int MouseSleepTime = 3;  // length of time a mouse spends sleeping

/*
 * Once the main driver function (catmouse()) has created the cat and mouse
 * simulation threads, it uses this semaphore to block until all of the
 * cat and mouse simulations are finished.
 */
struct semaphore *CatMouseWait;
struct semaphore *AvailableBowls;
volatile bool *bowlStatus;

//locks
struct lock *catLock;
struct lock *mouseLock;
struct lock *bowlLock;

//cvs
struct cv *catsHaveEaten;
struct cv *miceHaveEaten;

//additional thread modified values
int hungryMice = 0;
int hungryCats = 0;


/*
 * 
 * Function Definitions
 * 
 */


/*
 * cat_simulation()
 *
 * Arguments:
 *      void * unusedpointer: currently unused.
 *      unsigned long catnumber: holds cat identifier from 0 to NumCats-1.
 *
 * Returns:
 *      nothing.
 *
 * Notes:
 *      Each cat simulation thread runs this function.
 *
 *      You need to finish implementing this function using 
 *      the OS161 synchronization primitives as indicated
 *      in the assignment description
 */

static
void
cat_simulation(void * unusedpointer, 
               unsigned long catnumber)
{
  int i;
  unsigned int bowl;
  
  /* avoid unused variable warnings. */
  (void) unusedpointer;
  (void) catnumber;
  

  /* your simulated cat must iterate NumLoops times,
   *  sleeping (by calling cat_sleep() and eating
   *  (by calling cat_eat()) on each iteration */
  for(i=0;i<NumLoops;i++) {
   
    lock_acquire(catLock);
    hungryCats = hungryCats + 1;
    lock_release(catLock);

    /* do not synchronize calls to cat_sleep().
       Any number of cats (and mice) should be able
       sleep at the same time. */
    cat_sleep(CatSleepTime);

    /* legal bowl numbers range from 1 to NumBowls */
    P(AvailableBowls);
    for(int j = 0; j < NumBowls; j++) {
      lock_acquire(bowlLock);
      if(bowlStatus[j]) {
        bowl = j + 1;
        bowlStatus[j] = false;
        break;
      }
      lock_release(bowlLock);
    }
    lock_release(bowlLock);
    cat_eat(bowl, CatEatTime);
    lock_acquire(bowlLock);
    bowlStatus[bowl-1] = true;
    lock_release(bowlLock);
    V(AvailableBowls);
    
    //Wait until there are no hungry cats
    lock_acquire(catLock);
    hungryCats = hungryCats - 1;
    
    if(hungryCats == 0) {
      cv_broadcast(catsHaveEaten, catLock);
    }
    lock_release(catLock);

    //wait for mice to eat if cats aren't done eating
    if(i < (NumLoops - 1)) {
      lock_acquire(catLock);
      cv_wait(miceHaveEaten, catLock);
      lock_release(catLock);
    }

  }

  /* indicate that this cat simulation is finished */
  V(CatMouseWait); 
}

/*
 * mouse_simulation()
 *
 * Arguments:
 *      void * unusedpointer: currently unused.
 *      unsigned long mousenumber: holds mouse identifier from 0 to NumMice-1.
 *
 * Returns:
 *      nothing.
 *
 * Notes:
 *      each mouse simulation thread runs this function
 *
 *      You need to finish implementing this function using 
 *      the OS161 synchronization primitives as indicated
 *      in the assignment description
 *
 */

static
void
mouse_simulation(void * unusedpointer,
          unsigned long mousenumber)
{
  int i;
  unsigned int bowl;

  /* Avoid unused variable warnings. */
  (void) unusedpointer;
  (void) mousenumber;

  //cats go first
  lock_acquire(mouseLock);
    cv_wait(catsHaveEaten, mouseLock);
  lock_release(mouseLock);

  /* your simulated mouse must iterate NumLoops times,
   *  sleeping (by calling mouse_sleep()) and eating
   *  (by calling mouse_eat()) on each iteration */
  for(i=0;i<NumLoops;i++) {

    lock_acquire(mouseLock);
    hungryMice = hungryMice + 1;
    lock_release(mouseLock);

    /* do not synchronize calls to mouse_sleep().
       Any number of mice (and cats) should be able
       sleep at the same time. */
    mouse_sleep(MouseSleepTime);

    /* legal bowl numbers range from 1 to NumBowls */
    P(AvailableBowls);
    for(int j = 0; j < NumBowls; j++) {
      lock_acquire(bowlLock);
      if(bowlStatus[j]) {
        bowl = j + 1;
        bowlStatus[j] = false;
        break;
      }
      lock_release(bowlLock);
    }
    lock_release(bowlLock);
    mouse_eat(bowl, MouseEatTime);

    lock_acquire(bowlLock);
    bowlStatus[bowl-1] = true;
    lock_release(bowlLock);

    V(AvailableBowls);

    //Wait until there are no hungry mice                                                                             
    lock_acquire(mouseLock);
    hungryMice = hungryMice - 1;
    
    if(hungryMice == 0) {
      cv_broadcast(miceHaveEaten, mouseLock);
    }
    lock_release(mouseLock);
    
    // wait for cats to eat unless all mice are done eating
    if(i < (NumLoops - 1)) {
      lock_acquire(mouseLock);
      cv_wait(catsHaveEaten, mouseLock);
      lock_release(mouseLock);
    }

  }

  /* indicate that this mouse is finished */
  V(CatMouseWait); 
}

static
void
dumb_cat(void * unusedpointer,
		 unsigned long mousenumber)
{
  int i;

  /* Avoid unused variable warnings. */
  (void) unusedpointer;
  (void) mousenumber;

  for(i=0;i<NumLoops;i++) {

    lock_acquire(mouseLock);
    cv_broadcast(catsHaveEaten, mouseLock);
    lock_release(mouseLock);
  
    if( i < (NumLoops-1)) {
      lock_acquire(catLock);
      cv_wait(miceHaveEaten, catLock);
      lock_release(catLock);
    }
  }
}

static
void
dumb_mouse(void * unusedpointer,
	 unsigned long catnumber)
{
  int i;

  /* Avoid unused variable warnings. */
  (void) unusedpointer;
  (void) catnumber;

  for(i=0;i<NumLoops;i++) {

    lock_acquire(catLock);
    cv_broadcast(miceHaveEaten, catLock);
    lock_release(catLock);

    if( i < (NumLoops - 1)) {
      lock_acquire(mouseLock);
      cv_wait(catsHaveEaten, mouseLock);
      lock_release(mouseLock);
    }
  }
}

/*
 * catmouse()
 *
 * Arguments:
 *      int nargs: should be 5 or 9
 *      char ** args: args[1] = number of food bowls
 *                    args[2] = number of cats
 *                    args[3] = number of mice
 *                    args[4] = number of loops
 * Optional parameters
 *                    args[5] = cat eating time
 *                    args[6] = cat sleeping time
 *                    args[7] = mouse eating time
 *                    args[8] = mouse sleeping time
 *
 * Returns:
 *      0 on success.
 *
 * Notes:
 *      Driver code to start up cat_simulation() and
 *      mouse_simulation() threads.
 *      You may need to modify this function, e.g., to
 *      initialize synchronization primitives used
 *      by the cat and mouse threads.
 *      
 *      However, you should should ensure that this function
 *      continues to create the appropriate numbers of
 *      cat and mouse threads, to initialize the simulation,
 *      and to wait for all cats and mice to finish.
 */

int
catmouse(int nargs,
         char ** args)
{
  int index, error;
  int i;

  /* check and process command line arguments */
  if ((nargs != 9) && (nargs != 5)) {
    kprintf("Usage: <command> NUM_BOWLS NUM_CATS NUM_MICE NUM_LOOPS\n");
    kprintf("or\n");
    kprintf("Usage: <command> NUM_BOWLS NUM_CATS NUM_MICE NUM_LOOPS ");
    kprintf("CAT_EATING_TIME CAT_SLEEPING_TIME MOUSE_EATING_TIME MOUSE_SLEEPING_TIME\n");
    return 1;  // return failure indication
  }

  /* check the problem parameters, and set the global variables */
  NumBowls = atoi(args[1]);
  if (NumBowls <= 0) {
    kprintf("catmouse: invalid number of bowls: %d\n",NumBowls);
    return 1;
  }
  NumCats = atoi(args[2]);
  if (NumCats < 0) {
    kprintf("catmouse: invalid number of cats: %d\n",NumCats);
    return 1;
  }
  NumMice = atoi(args[3]);
  if (NumMice < 0) {
    kprintf("catmouse: invalid number of mice: %d\n",NumMice);
    return 1;
  }
  NumLoops = atoi(args[4]);
  if (NumLoops <= 0) {
    kprintf("catmouse: invalid number of loops: %d\n",NumLoops);
    return 1;
  }

  if (nargs == 9) {
    CatEatTime = atoi(args[5]);
    if (CatEatTime < 0) {
      kprintf("catmouse: invalid cat eating time: %d\n",CatEatTime);
      return 1;
    }
  
    CatSleepTime = atoi(args[6]);
    if (CatSleepTime < 0) {
      kprintf("catmouse: invalid cat sleeping time: %d\n",CatSleepTime);
      return 1;
    }
  
    MouseEatTime = atoi(args[7]);
    if (MouseEatTime < 0) {
      kprintf("catmouse: invalid mouse eating time: %d\n",MouseEatTime);
      return 1;
    }
  
    MouseSleepTime = atoi(args[8]);
    if (MouseSleepTime < 0) {
      kprintf("catmouse: invalid mouse sleeping time: %d\n",MouseSleepTime);
      return 1;
    }
  }

  kprintf("Using %d bowls, %d cats, and %d mice. Looping %d times.\n",
          NumBowls,NumCats,NumMice,NumLoops);
  kprintf("Using cat eating time %d, cat sleeping time %d\n", CatEatTime, CatSleepTime);
  kprintf("Using mouse eating time %d, mouse sleeping time %d\n", MouseEatTime, MouseSleepTime);

  /* create the semaphore that is used to make the main thread
     wait for all of the cats and mice to finish */
  CatMouseWait = sem_create("CatMouseWait",0);
  if (CatMouseWait == NULL) {
    panic("catmouse: could not create semaphore\n");
  }

  //create a semaphore to track the available bowls
  AvailableBowls = sem_create("AvailableBowls", NumBowls);
  if (AvailableBowls == NULL) {
    panic("availblebowls: could not create semaphore\n");
  }

  // initialize locks
  catLock  = lock_create("catLock");
  if (catLock == NULL) {
    panic("catLock: could not create lock\n");
  }

  mouseLock  = lock_create("mouseLock");
  if (mouseLock == NULL) {
    panic("mouseLock: could not create lock\n");
  }

  bowlLock  = lock_create("bowlLock");
  if (bowlLock == NULL) {
    panic("bowlLock: could not create lock\n");
  }

  //initialize cvs
  catsHaveEaten  = cv_create("catsHaveEaten");
  if (catsHaveEaten == NULL) {
    panic("catsHaveEaten: could not create cv\n");
  }

  miceHaveEaten  = cv_create("miceHaveEaten");
  if (miceHaveEaten == NULL) {
    panic("miceHaveEaten: could not create cv\n");
  }

  /* 
   * initialize the bowls
   */
  if (initialize_bowls(NumBowls)) {
    panic("catmouse: error initializing bowls.\n");
  }

  //initialize bowl Status array
  if (bowlStatus == NULL) {
    bowlStatus = kmalloc(NumBowls * sizeof(bool));
    KASSERT(bowlStatus != NULL);
  }
  for(int i = 0; i < NumBowls; i++) {
    bowlStatus[i] = true;
  }

  /*
   * Start NumCats cat_simulation() threads.
   */
  for (index = 0; index < NumCats; index++) {
    error = thread_fork("cat_simulation thread", NULL, cat_simulation, NULL, index);
    if (error) {
      panic("cat_simulation: thread_fork failed: %s\n", strerror(error));
    }
  }

  /*
   * Start NumMice mouse_simulation() threads.
   */
  for (index = 0; index < NumMice; index++) {
    error = thread_fork("mouse_simulation thread", NULL, mouse_simulation, NULL, index);
    if (error) {
      panic("mouse_simulation: thread_fork failed: %s\n",strerror(error));
    }
  }

  //if there are no cats let mice eat first
  if (NumCats == 0) {
    error = thread_fork("dumb_cat thread", NULL, dumb_cat, NULL, index);
  }
  if (NumMice == 0) {
    error = thread_fork("dumb_mouse thread", NULL, dumb_mouse, NULL, index);
  }


  /* wait for all of the cats and mice to finish before
     terminating */  
  for(i=0;i<(NumCats+NumMice);i++) {
    P(CatMouseWait);
  }

  /* clean up the semaphore that we created */
  sem_destroy(CatMouseWait);
  sem_destroy(AvailableBowls);

  // clean up locks we created
  lock_destroy(catLock);
  lock_destroy(mouseLock);
  lock_destroy(bowlLock);

  // clean up cvs we created
  cv_destroy(catsHaveEaten);
  cv_destroy(miceHaveEaten);

  /* clean up resources used for tracking bowl use */
  cleanup_bowls();

  return 0;
}

/*
 * End of catmouse.c
 */
