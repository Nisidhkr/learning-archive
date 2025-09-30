#include <bits/stdc++.h>
using namespace std;
struct Node {
    int value;
    int* next ;
    void node(int value){
        this->value = value;
        next = NULL;
    }
};
void print(Node *head){
    if(head == NULL){
        return;
    }
    cout << (head->value)<< "  ";
    print(head->next);
}


int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = new node(10)
    
    
    
    return 0;
}