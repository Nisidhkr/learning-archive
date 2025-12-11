# include <iostream>
using namespace std;
struct  Node
{
    /* data */
    int data;
    Node* left;
    Node* right;
    Node(int d){
        data = d;
        left = right = NULL;
    }
};
void inOrder(Node * root){
    if (root != NULL){
        
    inOrder(root-> left);
    cout<< root->data<< endl;
    inOrder(root->right);
    }
    
}

int main(){
    Node *root = new Node (12);
    root->left = new Node (15);
    root->right = new Node (59);
    root-> left -> right = new Node (46);
    root->right ->left = new Node (5);
    inOrder(root);
}
