#include<stdio.h>
#include<stdlib.h>
struct node{
	struct node *lchild;
	int data;
	struct node *rchild;
};
typedef struct node NODE;
NODE* insert(NODE*,int);
void inorder(NODE*);
void preorder(NODE*);
void postorder(NODE*);
int count_nodes(NODE*);
int height(NODE*);
NODE* search(NODE*,int);
NODE* delete(NODE*,int);
void display();
NODE* findMin(NODE*);
int main()
{
	NODE* root=NULL;
	NODE *temp;
	int choice,item,target,x;
	printf("\n MENU \n");
	printf("1.Insert \n");
	printf("2.Inorder traversal \n");
	printf("3.Preorder traversal \n");
	printf("4.Postorder traversal \n");
	printf("5.Count nodes \n");
	printf("6.Height\n");
	printf("7.Search \n");
	printf("8.Delete \n");
	printf("9.Display \n");
	printf("10.Exit \n");
	printf("Enter your choice:");
	scanf("%d",&choice);
	switch(choice)
	{
		case 1: 
				printf("Enter the element to be inserted: ");
				scanf("%d",&item);
				root=insert(root,item);
				break;
		case 2:
				inorder(root);
				break;
		case 3: 
				preorder(root);
				break;
		case 4: 
				postorder(root);
				break;
		case 5: 
				count_nodes(root);
				break;
		case 6:
				height(root);
				break;
		case 7:
				printf("Enter the element to be searched: ");
				scanf("%d",&target);
				search(root,target);
				break;
		case 8: 
				printf("Enter the element to be deleted: ");
				scanf("%d",&x);
				temp=delete(root,x);
				break;
		case 9: 
				display(root);				
				break;
		case 10:
				exit(0);
		default:
				printf("Invalid choice");
	}
}
NODE* insert(NODE *root,int item)
{
	if(root==NULL)
	{
		root=(NODE*)malloc(sizeof(NODE));
		root->data=item;
		root->lchild=NULL;
		root->rchild=NULL;
	}
	else if(item <root->lchild)
		root=insert(root->lchild,item);
	else
		root=insert(root->rchild,item);
	return root;
}
void inorder(NODE *root)
{
	if(root!=NULL){
	inorder(root->lchild);
	printf("%d",root->data);
	inorder(root->rchild);
	}
}
void preorder(NODE *root)
{
	if(root!=NULL){
	printf("%d",root->data);
	preorder(root->lchild);
	preorder(root->rchild);
	}
}	
void postorder(NODE *root)
{
	if(root!=NULL){
	postorder(root->lchild);
	postorder(root->rchild);
	printf("%d",root->data);
	}
}
int count_nodes(NODE *root)
{
	if(root==NULL)
		return 0;
	else
		return count_nodes(root->lchild)+1+count_nodes(root->rchild);
}
int height(NODE *root)
{
	int lst,rst;
	if(root==NULL)
		return 0;
	else
	{
		lst=height(root->rchild);
		rst=height(root->lchild);
		if(lst>rst)
			return (lst+1);
		else
			return (rst+1);
	}
}
NODE* search(NODE *root,int target)
{
	if(root==NULL||root->data==target)
		return root;
	if(root->data<target)
		return search(root->rchild,target);
	return search(root->lchild,target);							
}
NODE* delete(NODE *root,int x)
{
	NODE *temp;
	if(root==NULL)
		return NULL;
	if(x>root->data)
		root->rchild=delete(root->rchild,x);
	else if(x<root->data)
		root->lchild=delete(root->lchild,x);
	else
	{
		if(root->lchild==NULL&&root->rchild==NULL){
		free(root);
		return NULL;
		}
		else if (root->lchild== NULL
                 || root->rchild == NULL) {
            if (root->lchild == NULL) {
                temp = root->rchild;
            }
            else {
                temp = root->lchild;
            }
            free(root);
            return temp;
        }
        else {
            temp=findMin(root->rchild);
            root->data = temp->data;
            root->rchild= delete (root->rchild, temp->data);
        }
    }
    return root;
}			
void display(NODE *root) {
    if (root != NULL) {
        display(root->lchild);
        printf("%d ", root->data);
        display(root->rchild);
     }
}        
NODE* findMin(NODE* root)
{
    if (root == NULL) {
        return NULL;
    }
    else if (root->lchild != NULL) {
        return findMin(root->lchild);
    }
    return root;
}

									
