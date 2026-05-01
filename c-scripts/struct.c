#include <stdio.h>
#include <string.h>

#define MAX_RECORDS 2

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

    while (num_records < MAX_RECORDS) {
        printf("Enter name: ");
        scanf("%s", phonebook[num_records].name);

        printf("Enter age: ");
        scanf("%d", &phonebook[num_records].age);

        printf("Enter sex: ");
        scanf(" %c", &phonebook[num_records].sex);

        printf("Enter phone number: ");
        scanf("%s", phonebook[num_records].phone);

        printf("Enter zip code: ");
        scanf("%d", &phonebook[num_records].zip);

        num_records++;
        printf("\n");
    }

    printf("\nPhonebook:\n");
    for (int i = 0; i < num_records; i++) {
        printf("%s %d %c %s %d\n", phonebook[i].name, phonebook[i].age, phonebook[i].sex, phonebook[i].phone, phonebook[i].zip);
    }

    return 0;
}
