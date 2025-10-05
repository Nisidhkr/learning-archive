#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data;
    Node *next;
    Node *prev;
    Node(int d){
        data = d ;
        next = prev = NULL;
    }
    /* data */

};

Node *insertAtBeginning(Node* head, int valueToBeInserted){
    Node * temp = new Node (valueToBeInserted);
    Node *curr = head;
    if(head!=NULL){
        temp->next = curr;
        curr->prev = temp;
    

    }
    return temp;

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
    Node *head = new Node (10);
    Node *temp1 = new Node(29);
    Node *temp2 = new Node(221);
    head->next = temp1;
    temp1->prev = head ;
    temp1 -> next = temp2;
    temp2 -> prev = temp1;
    head = insertAtBeginning(head, 77);
    printList(head);
    
    return 0;
}