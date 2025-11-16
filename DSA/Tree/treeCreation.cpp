#include <bits/stdc++.h>
using namespace std;
struct Node {
    int data;
    Node right;
    Node left;

    Node(int d){
        data = d;
        left = right = NULL;
    }
};
int fun(){

}

int main() {
    Node obj = new Node (10);
    obj->left = new Node (70);
    obj->right = new Node (45);
    obj->left->right = new Node (83);
    
    
    
    return 0;
}