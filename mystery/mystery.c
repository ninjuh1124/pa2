#include <stdio.h>
#include <string.h>

int n[200];

int compute_fib(int x) {
    if (x<=1) { n[x] = 1; }
    else { n[x] = n[x-1] + n[x-2]; }
    
}

int main(int argc, char**argv) {
    int x = atoi(argv[1]);
    int i;
    for (i=0; i<200; i++) {
        compute_fib(i);
    }
    
    if (x >= 0  && x < 200) {
        printf("Value: %d\n", n[x-1]);
    } else {
        printf("Value: 0\n");
    }

    return 0;
}
