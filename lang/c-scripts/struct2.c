/* struct2.c - demo on array of structures holding person name,age,sex,phone,zip */
#include <stdio.h>
#include <string.h>

#define MAX_RECORDS 3

struct record {
    char name[50];
    int age;
    char sex;
    char phone[10];
    int zip;
};

int main() {
    struct record phonebook[MAX_RECORDS];
    int num_records = 0;
    strcpy(phonebook[0].name, "John");
    phonebook[0].age = 30;
    phonebook[0].sex = 'M';
    strcpy(phonebook[0].phone, "1234567890");
    phonebook[0].zip = 12345;

    strcpy(phonebook[1].name, "Jane");
    phonebook[1].age = 25;
    phonebook[1].sex = 'F';
    strcpy(phonebook[1].phone, "0987654321");
    phonebook[1].zip = 54321;
    
    strcpy(phonebook[2].name, "Bob");
    phonebook[2].age = 35;
    phonebook[2].sex = 'M';
    strcpy(phonebook[2].phone, "5555555555");
    phonebook[2].zip = 99999;

    printf("\nPhonebook:\n");
    for (int i = 0; i < 3; i++) {
        printf("%s %d %c %s %d\n", phonebook[i].name, phonebook[i].age, phonebook[i].sex, phonebook[i].phone, phonebook[i].zip);
    }

    return 0;
} 