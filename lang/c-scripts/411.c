#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "411b.h"



int main() {
    int choice;
    do {
        printf("\nPhonebook Menu:\n");
        printf("1. Add Contact\n");
        printf("2. Search Contact\n");
        printf("3. List All Contacts\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        while (getchar() != '\n'); // Clear input buffer

        switch (choice) {
            case 1:
                addContact();
                break;
            case 2:
                searchContact();
                break;
            case 3:
                listContacts();
                break;
            case 4:
                printf("Exiting Phonebook. Goodbye!\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while (choice != 4);

    return 0;
}
