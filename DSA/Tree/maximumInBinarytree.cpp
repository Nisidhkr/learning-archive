#include <bits/stdc++.h>
using namespace std;
struct Node {
    int data;
    Node* right;
    Node* left;

    Node(int d){
        data = d;
        left = right = NULL;
    }
};
int maximumInBinaryTree(Node* root){
        if(root==NULL) return INT16_MIN;
        else
            return max(root->data,max(maximumInBinaryTree(root->left),maximumInBinaryTree(root->right)));
}

int main() {
    Node* root = new Node (10);
    root->left = new Node (70);
    root->right = new Node (45);
    root->left->right = new Node (83);
    cout << "Max value in tree is :"<<maximumInBinaryTree(root);
    return 0;
}