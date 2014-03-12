/*
 * catmouse.c
 *
 * 30-1-2003 : GWA : Stub functions created for CS161 Asst1.
 * 26-11-2007: KMS : Modified to use cat_eat and mouse_eat
 * 21-04-2009: KMS : modified to use cat_sleep and mouse_sleep
 * 21-04-2009: KMS : added sem_destroy of CatMouseWait
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

extern void cat_eat(unsigned int bowlnumber);
extern void mouse_eat(unsigned int bowlnumber);
extern void cat_sleep(void);
extern void mouse_sleep(void);

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
 *
 */
int NumBowls;  // number of food bowls
int NumCats;   // number of cats
int NumMice;   // number of mice
int NumLoops;  // number of times each cat and mouse should eat

/*
 * Once the main driver function (catmouse()) has created the cat and mouse
 * simulation threads, it uses this semaphore to block until all of the
 * cat and mouse simulations are finished.
 */
struct semaphore *CatMouseWait;

/*
 * Array of bowls arranged such that Bowls[0] is the next available bowl.
 */
int *Bowls; // array size NumBowls
volatile int *CatsRound, *MiceRound; // Number of times each creatures ate already
volatile int Round; // minimum number of times all the creatures ate already
volatile int NumCatsEating; // Number of cats currently eating
volatile int NumMiceEating; // Number of mice currently eating
/*
 * Lock for each of the bowls
 */
struct lock **l_Bowl; // array size NumBowls
struct cv *cv_MiceEating, *cv_CatsEating; // Condition variables to check if the other creature is eating or not
struct cv *cv_Round; // Condition variable to check if all the creatures have ate at least Round times


/*
 * This returns min {a, b}
 */
static int min (int a, int b){
	if (a <= b){
		return a;
	}
	else {
		return b;
	}
}

/*
 * Update Round.
 * Round is the least number of times any creature ate
 * The concept of Round is used so that no one creature will eat more than 1 times than any other creature
 * This is done to have "fairness" between the creatures.
 */
static void update_round(){
	// Find the minimum Round between all the creatures (CatsRound, MiceRound) and set that as the Round.
	int i;
	Round = NumLoops;
	for (i = 0; i < NumCats; i++){
		if (Round != CatsRound[i]){
			Round = min(Round, CatsRound[i]);
		}
	}
	for (i = 0; i < NumMice; i++){
		if (Round != MiceRound[i]){
			Round = min(Round, MiceRound[i]);
		}
	}
}

/*
 * From our definition, next available bowl is in Bowls[0].
 * This function shifts the elements of Bowls so that the first element (Bowls [0]) goes to the end,
 * and every other elements are shifted to the left.
 */
static int find_bowl (){
	int i;
	int bowl = Bowls[0];
	for (i = 0; i < NumBowls-1; i++){
		Bowls[i] = Bowls[i+1];
	}
	Bowls[NumBowls-1] = bowl;
	return bowl;
}

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

    /* do not synchronize calls to cat_sleep().
       Any number of cats (and mice) should be able
       sleep at the same time. */
    cat_sleep();

    /*
     * Find the next available bowl and subtract by 1 to get the array index
     * instead of bowl number
     */
    bowl = find_bowl()-1;
    lock_acquire (l_Bowl[bowl]); // Acquire the lock for the next available bowl
    /*
     * this condition is to check if all the creatures have ate the same number of times
     * or at most 1 less/more time (to be fair to all creatures)
     */
    while (i > Round){
    	cv_wait (cv_Round, l_Bowl[bowl]);
    }
    /*
     * This condition checks to see if there are any mouse currently eating
     */
    while (NumMiceEating > 0){
    	cv_wait (cv_MiceEating, l_Bowl[bowl]);
    }
    NumCatsEating = NumCatsEating + 1; // this cat is now going to eat
    cat_eat (bowl+1); // eat from bowl! (+1 is because I subtracted 1 above to get the index)
    CatsRound [catnumber] = i+1; // This cat has ate, so increase it's round number
    update_round(); // Calculate the round for all creatures
    cv_broadcast (cv_Round, l_Bowl[bowl]); // broadcast for any creatures waiting for this cat to finnish eating
    NumCatsEating = NumCatsEating - 1; // this cat is done eating, so 1 less cat currently eating
    cv_broadcast (cv_CatsEating, l_Bowl[bowl]); // notify for all cats done eating
    lock_release(l_Bowl[bowl]); // let go of this bowl

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


  /* your simulated mouse must iterate NumLoops times,
   *  sleeping (by calling mouse_sleep()) and eating
   *  (by calling mouse_eat()) on each iteration */
  for(i=0;i<NumLoops;i++) {

    /* do not synchronize calls to mouse_sleep().
       Any number of mice (and cats) should be able
       sleep at the same time. */
    mouse_sleep();

    /*
     * Please note that the mouse_simulation is basically the same as
     * the cat_simulation, so I did not provide any comments explaining what I did
     * because I already commented then in cat_simulation.
     */

    bowl = find_bowl()-1;
	lock_acquire (l_Bowl[bowl]);
	while (i > Round){
		cv_wait (cv_Round, l_Bowl[bowl]);
	}

	while (NumCatsEating > 0){
		cv_wait (cv_CatsEating, l_Bowl[bowl]);
	}
	NumMiceEating = NumMiceEating + 1;
	mouse_eat (bowl+1);
	MiceRound [mousenumber] = i+1;
	update_round();
	cv_broadcast (cv_Round, l_Bowl[bowl]);
	NumMiceEating = NumMiceEating - 1;
	cv_broadcast (cv_MiceEating, l_Bowl[bowl]);
	lock_release(l_Bowl[bowl]);
  }

  /* indicate that this mouse is finished */
  V(CatMouseWait); 
}


/*
 * catmouse()
 *
 * Arguments:
 *      int nargs: should be 5
 *      char ** args: args[1] = number of food bowls
 *                    args[2] = number of cats
 *                    args[3] = number of mice
 *                    args[4] = number of loops
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
  if (nargs != 5) {
    kprintf("Usage: <command> NUM_BOWLS NUM_CATS NUM_MICE NUM_LOOPS\n");
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
  kprintf("Using %d bowls, %d cats, and %d mice. Looping %d times.\n",
          NumBowls,NumCats,NumMice,NumLoops);

  /* create the semaphore that is used to make the main thread
     wait for all of the cats and mice to finish */
  CatMouseWait = sem_create("CatMouseWait",0);
  if (CatMouseWait == NULL) {
    panic("catmouse: could not create semaphore\n");
  }

  /* 
   * initialize the bowls
   */
  if (initialize_bowls(NumBowls)) {
    panic("catmouse: error initializing bowls.\n");
  }


  /*
   * initialize variables, locks, and condition variables
   */
  Bowls = kmalloc (NumBowls * sizeof(int));
  CatsRound = kmalloc (NumCats * sizeof(int));
  MiceRound = kmalloc (NumMice * sizeof(int));
  Round = 0;
  NumCatsEating = 0;
  NumMiceEating = 0;
  l_Bowl = kmalloc (NumBowls * sizeof(struct lock *)); // initializa array of locks
  cv_MiceEating = cv_create ("cv_MiceEating");
  // check if the condition variable was created successfully
  if (cv_MiceEating == NULL){
	  panic ("catmouse: error creating cv_MiceEating\n");
  }
  cv_CatsEating = cv_create ("cv_CatsEating");
  if (cv_CatsEating == NULL){
  	  panic ("catmouse: error creating cv_CatsEating\n");
    }
  cv_Round = cv_create ("cv_Round");
  for (i = 0; i < NumBowls; i++){
	  Bowls[i] = i+1; // set the Bowls as the bowl number (not bowl index)
	  l_Bowl[i] = lock_create ("l_Bowl");
	  if (l_Bowl[i] == NULL){
		  panic ("catmouse: error creating l_Bowl%d\n", i+1);
	  }
  }
  /*
   * initialize all the Rounds to 0 to indicate that no one ate yet
   */
  for (i = 0; i < NumCats; i++){
	  CatsRound [i] = 0;
  }
  for (i = 0; i < NumMice; i++){
	  MiceRound [i] = 0;
  }

  /*
   * Start NumCats cat_simulation() threads.
   */
  for (index = 0; index < NumCats; index++) {
    error = thread_fork("cat_simulation thread",NULL,index,cat_simulation,NULL);
    if (error) {
      panic("cat_simulation: thread_fork failed: %s\n", strerror(error));
    }
  }

  /*
   * Start NumMice mouse_simulation() threads.
   */
  for (index = 0; index < NumMice; index++) {
    error = thread_fork("mouse_simulation thread",NULL,index,mouse_simulation,NULL);
    if (error) {
      panic("mouse_simulation: thread_fork failed: %s\n",strerror(error));
    }
  }

  /* wait for all of the cats and mice to finish before
     terminating */  
  for(i=0;i<(NumCats+NumMice);i++) {
    P(CatMouseWait);
  }

  /* clean up the semaphore the we created */
  sem_destroy(CatMouseWait);

  /* Clean up */
  kfree (Bowls);
  kfree (CatsRound);
  kfree (MiceRound);
  for (i = 0; i < NumBowls; i++){
	  lock_destroy(l_Bowl[i]);
  }
  kfree (l_Bowl);
  cv_destroy (cv_MiceEating);
  cv_destroy (cv_CatsEating);
  cv_destroy (cv_Round);

  return 0;
}

/*
 * End of catmouse.c
 */
