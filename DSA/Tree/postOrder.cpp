# include <iostream>
using namespace std;
struct Node {
    int data;
    Node *left;
    Node *right;
    Node(int v){
        data = v;
        left = right = NULL;
    }
};

void postOrder(Node *root){
    if (root != NULL){
        
        postOrder(root->left);
        postOrder(root->right);
        cout << root->data<<"  ";
    }
}

int main(){
    Node *root = new Node (12);
    root->left = new Node (15);
    root->right = new Node (59);
    root-> left -> right = new Node (46);
    root->right ->left = new Node (5);
    postOrder(root);
}





