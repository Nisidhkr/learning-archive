#include <bits/stdc++.h>
using namespace std;
struct Node{
    int value;
    Node *next;
    Node(int x){
        value = x ;
        next = NULL ;
    } 
};
void printList(Node *head){
   
    while(head!= NULL){
       cout<<(head->value)<< " -> ";
       head= head->next; 
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = new Node(10);
    head->next = new Node(20);
    head->next->next = new Node(22);
    
    printList(head);
    
    return 0;
}