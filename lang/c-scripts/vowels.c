/* vowels.c - count vowels in a string */
#include <stdio.h>

int main() {
        char vowels[5] = {'a', 'e', 'i', 'o', 'u'};
        int count = 0;
        for (int i = 0; i < 5; i++) {
                printf("%c\n", vowels[i]);
                count++;
        }
    return 0;
}