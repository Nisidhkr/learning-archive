#include <bits/stdc++.h>
using namespace std;
struct Node {
    int value;
    Node *next;
    Node (int x){
        value = x;
        next = NULL;

    }
};
Node *insertAtBeggining(Node *head, int valueToBeInserted){
    Node *temp = new Node (valueToBeInserted);
    temp->next = head;
    return temp;
}
void printList(Node* head) {
    Node *current = head;
    while (current != NULL) {
        cout << current->value << "--------";
        current = current->next;
    }
    //cout << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = NULL;
    head = insertAtBeggining(head,100);
    head = insertAtBeggining(head,101);
    head = insertAtBeggining(head,102);
    head = insertAtBeggining(head,103);
    head = insertAtBeggining(head,104);
    head = insertAtBeggining(head,105);
    head = insertAtBeggining(head,106);
    head = insertAtBeggining(head,107);
    head = insertAtBeggining(head,108);
    head = insertAtBeggining(head,109);
    head = insertAtBeggining(head,110);
    printList(head);
    
    
    return 0;
}