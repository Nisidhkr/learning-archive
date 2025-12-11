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

void nodesAtKdistance(Node *root, int dist) {
    if (root == NULL) {
        return;
    }
    if (dist == 0) {
        cout << root->data << " ";
    } else {
        nodesAtKdistance(root->left, dist - 1);
        nodesAtKdistance(root->right, dist - 1);
    }
}

int main() {
    
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);

    root->left->left = new Node(4);
    root->left->right = new Node(5);
    root->right->left = new Node(6);
    root->right->right = new Node(7);

    root->left->left->left = new Node(8);
    root->left->left->right = new Node(9);
    root->left->right->left = new Node(10);
    root->left->right->right = new Node(11);

    root->right->left->left = new Node(12);
    root->right->left->right = new Node(13);
    root->right->right->left = new Node(14);
    root->right->right->right = new Node(15);

    root->left->left->left->left = new Node(16);
    root->left->left->left->right = new Node(17);
    root->right->right->right->left = new Node(18);
    root->right->right->right->right = new Node(19);

    // Test: print nodes at different distances
    for (int k = 0; k <= 4; k++) {
        cout << "Nodes at distance " << k << ": ";
        nodesAtKdistance(root, k);
        cout << endl;
    }

    return 0;
}

// time complexity of this solution in worst case is theta n 
// and best case time complexity is bigO of 1 

// auxlary space required is bigO of H