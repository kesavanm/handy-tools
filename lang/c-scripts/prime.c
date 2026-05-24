#include <stdio.h>
#define MAX 10

int main() {
    int i, j, count = 0;
    int num[MAX];

    for (i = 2; count < MAX; i++) {
        for (j = 2; j <= i/2; j++) {
            if (i % j == 0) {
                break;
            }
        }
        if (j > i/2) {
            num[count] = i;
            count++;
        }
    }

    printf("First %d prime numbers are: ", MAX);
    for (i = 0; i < MAX; i++) {
        printf("%d ", num[i]);
    }
    printf("\n");

    return 0;
}