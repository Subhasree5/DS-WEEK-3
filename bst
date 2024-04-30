#include<stdio.h>
#include<stdlib.h>
struct node {
    struct node *lchild;
    struct node *rchild;
    int key;
};
typedef struct node NODE;
NODE* insert(NODE*, int);
void inorder(NODE*);
void preorder(NODE*);
void postorder(NODE*);
int count_nodes(NODE*);
void display();
int main() {
    NODE *root = NULL;
    int choice, item;
    while (1) {
        printf("\n MENU \n");
        printf("1.Insert \n");
        printf("2.Inorder traversal \n");
        printf("3.Preorder traversal \n");
        printf("4.Postorder traversal \n");
        printf("5.Count nodes \n");
        printf("6.Display \n");
        printf("7.Exit \n");
        printf("Enter your choice:");
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                printf("Enter the element to be inserted:");
                scanf("%d", &item);
                root = insert(root, item);
                break;
            case 2:
                inorder(root);
                break;
            case 3:
                preorder(root);
                break;
            case 4:
                postorder(root);
                bre
            case 6:
                display(root);
                break;
            case 7:
            	exit(0);    
            default:
                printf("Invalid Choice\n");
        }
    }
}

void inorder(NODE *root) {
    if (root != NULL) {
        inorder(root->lchild);
        printf("%d ", root->key);
        inorder(root->rchild);
    }
}

void preorder(NODE *root) {
    if (root != NULL) {
        printf("%d ", root->key);
        preorder(root->lchild);
        preorder(root->rchild);
    }
}

void postorder(NODE *root) {
    if (root != NULL) {
        postorder(root->lchild);
        postorder(root->rchild);
        printf("%d ", root->key);
    }
}

NODE* insert(NODE *root, int item) {
    if (root == NULL) {
        root = (NODE*)malloc(sizeof(NODE));
        root->key = item;
        root->lchild = NULL;
        root->rchild = NULL;
    } else if (item < root->key) {
        root->lchild = insert(root->lchild, item);
    } else {
        root->rchild = insert(root->rchild, item);
    }
    return root;
}

void display(NODE *root) {
    if (root != NULL) {
        display(root->lchild);
        printf("%d ", root->key);
        display(root->rchild);
    }
}
int count_nodes(NODE *root) {
    if (root == NULL)
        return 0;
    else
        return count_nodes(root->lchild) + 1 + count_nodes(root->rchild);
}

