/* fruits.c - array of fruits */
#include <stdio.h>

int main() {
    char fruits[5][20] = {"apple", "banana", "orange", "grape", "mango"};
    for (int i = 0; i < 5; i++) {
        printf("%s\n", fruits[i]);
    }
    return 0;
}
