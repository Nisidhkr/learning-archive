#include <bits/stdc++.h>
using namespace std;
struct Node{
    int data;
    Node *prev;
    Node *next;
    Node(int d){
        data = d;
        next = prev = NULL;
    }
};
Node *insertAtEnd(Node *head, int dataToBeInserted){

    Node *temp = new Node (dataToBeInserted);
    Node *curr = head;

    if(curr == NULL){
        
        return temp;
    }
    
    while(curr->next!=NULL){
        curr = curr->next;
    }
    temp->prev = curr;
    curr->next = temp;
    return head;

}
void printList(Node* head) {
    Node* curr = head;
    while (curr != NULL) {
        cout << curr->data << " ";
        curr = curr->next;
    }
    cout << "\n";
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
     cout << "Enter the value that you want to insert at end: "<< endl;
    int val;
    cin>> val;
     Node *head = new Node (10);
    Node *temp1 = new Node(29);
    Node *temp2 = new Node(221);
    head->next = temp1;
    temp1->prev = head ;
    temp1 -> next = temp2;
    temp2 -> prev = temp1;
   
    head = insertAtEnd(head, val);
    printList(head);
    
    
    
    return 0;
}