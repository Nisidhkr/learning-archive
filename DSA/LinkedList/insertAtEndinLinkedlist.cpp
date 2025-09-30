#include <bits/stdc++.h>
using namespace std;
struct Node {
    int value;
    Node *next;
    Node(int x){
        value = x;
        next = NULL;
    }
};
Node *insertAtEnd(Node *head,int valueToBeInserted){
     Node *temp = new Node (valueToBeInserted);
     if(head == NULL){
        return temp;
     }
    Node *curr = head;
    while(curr->next!=NULL){
      curr = curr->next;

    }
    curr->next = temp;
    return head;
}
void printList(Node* head) {
    Node *current = head;
    while (current != NULL) {
        cout << current->value << "-----------------";
        current = current->next;
    }
    //cout << endl;
}
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = NULL;
    head = insertAtEnd(head,10);
    head = insertAtEnd(head , 888);
    printList(head);
    return 0;
}