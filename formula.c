#include <stdio.h>
#include <time.h>
#include "nCr.h"

int main(int argc, char**argv) {
    if (strcmp(&argv[1][0], "-h") == 0) {
        printf("Usage: ./formula <positive integer>");
        return 0;
    }

    clock_t begin = clock(), end;
    int exp = atoi(argv[1]);
    int i;

    if (exp < 0) { fprintf(stderr, "Illegal input\n"); }
    else {
        i = 0;
        printf("%dx^%d ", nCr(exp, i), exp-i);
        for (i++; i<=exp; i++) {
            printf("+ %dx^%d ", nCr(exp, i), exp-i);
        }
    printf("\n");
    }
    end = clock();

    printf("Execution time: %f seconds\n", (double)(end - begin) / CLOCKS_PER_SEC); 
    return 0;
}
