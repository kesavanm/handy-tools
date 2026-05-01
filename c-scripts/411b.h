
#define MAX_NAME_LEN 50
#define MAX_PHONE_LEN 15
#define FILENAME "contacts.txt"

// Structure to hold a single contact entry
typedef struct {
    char name[MAX_NAME_LEN];
    char phone[MAX_PHONE_LEN];
} Contact;




// Function to add a new contact
void addContact() {
    FILE *fp = fopen(FILENAME, "a"); // Open in append mode, text mode
    if (fp == NULL) {
        perror("Error opening file");
        return;
    }

    Contact newContact;
    printf("Enter name: ");
    fgets(newContact.name, MAX_NAME_LEN, stdin);
    newContact.name[strcspn(newContact.name, "\n")] = 0; // Remove newline

    printf("Enter phone number: ");
    fgets(newContact.phone, MAX_PHONE_LEN, stdin);
    newContact.phone[strcspn(newContact.phone, "\n")] = 0; // Remove newline

    fwrite(&newContact, sizeof(Contact), 1, fp);
    fclose(fp);
    printf("Contact added successfully.\n");
}

// Function to search for a contact by name
void searchContact() {
    FILE *fp = fopen(FILENAME, "r"); // Open in read mode
    if (fp == NULL) {
        perror("Error opening file");
        return;
    }

    char keyword[MAX_NAME_LEN];
    printf("Enter keyword to search: ");
    fgets(keyword, MAX_NAME_LEN, stdin);
    keyword[strcspn(keyword, "\n")] = 0; // Remove newline

    Contact currentContact;
    long offset = 0;
    int found = 0;

    // Loop through the file, reading one contact at a time
    while (fread(&currentContact, sizeof(Contact), 1, fp) == 1) {
        if (strstr(currentContact.name, keyword) != NULL) {
            printf("%s, %s\n", currentContact.name, currentContact.phone);
            found = 1;
        }
    }

    if (!found) {
        printf("Contact not found.\n");
    }

    fclose(fp);
}

// Function to list all contacts
void listContacts() {
    FILE *fp = fopen(FILENAME, "r");
    if (fp == NULL) {
        perror("Error opening file");
        return;
    }

    Contact currentContact;
    printf("\n--- Phonebook Contacts ---\n");
    while (fread(&currentContact, sizeof(Contact), 1, fp) == 1) {
        printf("Name: %s, Phone: %s\n", currentContact.name, currentContact.phone);
    }
    printf("------------------------\n");
    fclose(fp);
}