#include <iostream>
using namespace std;

struct Node {
    int data;
    Node *left;
    Node *right;
    Node(int v) {
        data = v;
        left = right = NULL;
    }
};

int height(Node* root) {
    if (root == NULL) {
        return 0;
    } else {
        return max(height(root->left), height(root->right)) + 1;
    }
}

int main() {
    // Create a sample binary tree
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->left = new Node(4);
    root->left->right = new Node(5);
    root->right->left = new Node(6);
    root->right->right = new Node(7);
    root->left->left->left = new Node(8);

    cout << "Height of the tree: " << height(root) << endl;

    return 0;
}