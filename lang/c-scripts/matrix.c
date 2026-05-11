#include <stdio.h>
#define SIZE 4

int main() {
        int A[SIZE] = {1, 2, 3, 4};
        int B[SIZE] = {6, 7, 8, 9};
        int C[SIZE];

        for(int i = 0; i < SIZE; i++) {
                C[i] = A[i] + B[i];
                printf("%d ", C[i]);
        }
        printf("\n");
       
        return 0;
}