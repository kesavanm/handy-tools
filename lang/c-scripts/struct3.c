/* struct2.c - demo on array of structures holding person name,age,sex,phone,zip */
#include <stdio.h>
#include <string.h>

#define MAX_RECORDS 3

struct record {
    char name[5];
    int age;
    char sex;
    char phone[10];
    int zip;
};

int main() {
    struct record phonebook[MAX_RECORDS];
    int num_records = 0;
    
    struct record temp = {"Muthu", 30, 'M', "1234567890", 12345};
    phonebook[0] = temp;

    temp = (struct record){"Tamil", 25, 'F', "0987654321", 54321};
    phonebook[1] = temp;
    
    temp = (struct record){"Jane", 35, 'M', "5555555555", 99999};
    phonebook[2] = temp;

    printf("\nPhonebook:\n");
    for (int i = 0; i < 3; i++) {
        printf("%s %d %c %s %d\n", phonebook[i].name, phonebook[i].age, phonebook[i].sex, phonebook[i].phone, phonebook[i].zip);
    }

    return 0;
}