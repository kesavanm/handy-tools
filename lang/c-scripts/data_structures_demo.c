#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structure for singly linked list node
struct Node {
    int data;
    struct Node* next;
};

// Structure for stack
struct Stack {
    int top;
    unsigned capacity;
    int* array;
};

// Structure for queue
struct Queue {
    int front, rear, size;
    unsigned capacity;
    int* array;
};

// Structure for binary tree node
struct TreeNode {
    int data;
    struct TreeNode* left;
    struct TreeNode* right;
};

// Function to create a new linked list node
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Function to insert at beginning of linked list
void insertAtBeginning(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
}

// Function to print linked list
void printList(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Stack functions
struct Stack* createStack(unsigned capacity) {
    struct Stack* stack = (struct Stack*)malloc(sizeof(struct Stack));
    stack->capacity = capacity;
    stack->top = -1;
    stack->array = (int*)malloc(stack->capacity * sizeof(int));
    return stack;
}

int isFull(struct Stack* stack) {
    return stack->top == stack->capacity - 1;
}

int isEmpty(struct Stack* stack) {
    return stack->top == -1;
}

void push(struct Stack* stack, int item) {
    if (isFull(stack))
        return;
    stack->array[++stack->top] = item;
    printf("%d pushed to stack\n", item);
}

int pop(struct Stack* stack) {
    if (isEmpty(stack))
        return -1;
    return stack->array[stack->top--];
}

// Queue functions
struct Queue* createQueue(unsigned capacity) {
    struct Queue* queue = (struct Queue*)malloc(sizeof(struct Queue));
    queue->capacity = capacity;
    queue->front = queue->size = 0;
    queue->rear = capacity - 1;
    queue->array = (int*)malloc(queue->capacity * sizeof(int));
    return queue;
}

int isQueueFull(struct Queue* queue) {
    return (queue->size == queue->capacity);
}

int isQueueEmpty(struct Queue* queue) {
    return (queue->size == 0);
}

void enqueue(struct Queue* queue, int item) {
    if (isQueueFull(queue))
        return;
    queue->rear = (queue->rear + 1) % queue->capacity;
    queue->array[queue->rear] = item;
    queue->size = queue->size + 1;
    printf("%d enqueued to queue\n", item);
}

int dequeue(struct Queue* queue) {
    if (isQueueEmpty(queue))
        return -1;
    int item = queue->array[queue->front];
    queue->front = (queue->front + 1) % queue->capacity;
    queue->size = queue->size - 1;
    return item;
}

// Binary Tree functions
struct TreeNode* createTreeNode(int data) {
    struct TreeNode* newNode = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

struct TreeNode* insertTreeNode(struct TreeNode* node, int data) {
    if (node == NULL)
        return createTreeNode(data);
    if (data < node->data)
        node->left = insertTreeNode(node->left, data);
    else if (data > node->data)
        node->right = insertTreeNode(node->right, data);
    return node;
}

void inorderTraversal(struct TreeNode* root) {
    if (root != NULL) {
        inorderTraversal(root->left);
        printf("%d ", root->data);
        inorderTraversal(root->right);
    }
}


int main() {
    printf("Data Structures Demo in C\n\n");

    // Array demonstration
    printf("1. Array:\n");
    int arr[5] = {1, 2, 3, 4, 5};
    printf("Array elements: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n\n");

    // Linked List demonstration
    printf("2. Singly Linked List:\n");
    struct Node* head = NULL;
    insertAtBeginning(&head, 3);
    insertAtBeginning(&head, 2);
    insertAtBeginning(&head, 1);
    printf("Linked List: ");
    printList(head);
    printf("\n");

    // Stack demonstration
    printf("3. Stack:\n");
    struct Stack* stack = createStack(5);
    push(stack, 10);
    push(stack, 20);
    push(stack, 30);
    printf("Popped: %d\n", pop(stack));
    printf("Popped: %d\n", pop(stack));
    printf("\n");

    // Queue demonstration
    printf("4. Queue:\n");
    struct Queue* queue = createQueue(5);
    enqueue(queue, 10);
    enqueue(queue, 20);
    enqueue(queue, 30);
    printf("Dequeued: %d\n", dequeue(queue));
    printf("Dequeued: %d\n", dequeue(queue));
    printf("\n");

    // Binary Tree demonstration
    printf("5. Binary Search Tree:\n");
    struct TreeNode* root = NULL;
    root = insertTreeNode(root, 50);
    insertTreeNode(root, 30);
    insertTreeNode(root, 20);
    insertTreeNode(root, 40);
    insertTreeNode(root, 70);
    insertTreeNode(root, 60);
    insertTreeNode(root, 80);
    printf("Inorder traversal: ");
    inorderTraversal(root);
    printf("\n");

    // Free memory (simplified, not complete for all structures)
    free(stack->array);
    free(stack);
    free(queue->array);
    free(queue);

    return 0;
}