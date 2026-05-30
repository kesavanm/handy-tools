// iterate_plot.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 40

int arr[N];

void fill_random(void) {
    srand(1234);
    for (int i = 0; i < N; ++i) {
        arr[i] = rand() % 100;
        // breakpoint: inspect arr and i
    }
}

void bubble_stepwise(void) {
    for (int pass = 0; pass < N-1; ++pass) {
        for (int i = 0; i < N-1-pass; ++i) {
            if (arr[i] > arr[i+1]) {
                int t = arr[i]; arr[i] = arr[i+1]; arr[i+1] = t;
            }
            // breakpoint: inspect arr, i, pass to see swaps
        }
    }
}

int main(void) {
    fill_random();
    printf("before arr[0]=%d arr[N/2]=%d\n", arr[0], arr[N/2]);
    bubble_stepwise();
    printf("after arr[0]=%d arr[N/2]=%d\n", arr[0], arr[N/2]);
    return 0;
}
