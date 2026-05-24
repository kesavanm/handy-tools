/* score.c - array of scores */
#include <stdio.h>

int main() {
        int score[5] = {75, 68, 85, 90, 83};
        int count = 0;
        for (int i = 0; i < 5; i++) {
                printf("%d\n", score[i]);
                count++;
        }
    return 0;
}

