#include <bits/stdc++.h>
using namespace std;
struct Node {
    int data;
    Node *next;
    Node *prev;
    Node(int d){
        data = d;
        next =  NULL;

    }
}
Node *reverceLinkedList(Node *head){
    Node *curr = head;
    Node *prev = NULL;
    if (head == NULL){
        return NULL;
    }
    if (head->next ==NULL){
        return head;
    }
    while (curr!=NULL)
    {
        next = curr->next ;
        curr->next =prev;
        prev = curr;
        curr = next;
        /* code */
    }
    return prev;
    


}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
    
    
    return 0;
}