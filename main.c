#include <stdio.h>
#include <setjmp.h>

int *dash_errno;
int rootpid=0;
int shlvl=0;

struct jmploc {
	jmp_buf loc;
};

struct jmploc main_handler;
void readcmdfile(char *name) {}

int
dotcmd(int argc, char **argv) { return 0; }

int
exitcmd(int argc, char **argv) { return 0; }

extern int evalstring(char *, int);

int 
main(int argc, char **argv) {
  int i;
  int rc;
  
  if (argc>1) {
    for (i=1; i<argc-1; i++) {
      rc = evalstring(argv[1], 0);
      printf("rc=%d\n", rc);
    }
    rc = evalstring(argv[argc-1], 0);
    printf("rc=%d\n", rc);
  }
  
  return 0;
}
