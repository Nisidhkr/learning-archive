# include <iostream>
# include <queue>
using namespace std;
struct Node{
    int data;
    Node* left;
    Node* right;
    Node(int val){
        data = val;
        left = right = NULL;
    }
};

void levelOrderTreversal(Node *root){
    queue <Node*> q;
    if (root==NULL)return;
    q.push(root);
    while (q.empty()==false){
        Node* curr = q.front();
        q.pop();
        cout << curr->data<< "   ";
        if(curr->left!=NULL){
            q.push(curr->left);
        }
        if (curr->right!=NULL){
            q.push(curr->right);
        }
    }
}
int main(){
    Node* root = new Node (10);
    root->left = new Node(45);
    root->right = new Node(48);
    levelOrderTreversal(root);
}