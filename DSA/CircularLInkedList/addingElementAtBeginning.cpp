#include <bits/stdc++.h>
using namespace std;
struct Node{
    int data;
    Node *next;
    Node (int d){
        data = d;
        next = NULL;
    }
};
Node *insertAtBeginning(Node *head, int valueToBeInserted){
    Node *newValue = new Node(valueToBeInserted);
    Node *temp = head;
    if(head ==NULL){
        newValue->next = newValue;
        return newValue;
    }
    while(temp->next != head){
       temp = temp ->next;
    }
     temp->next = newValue;
        newValue->next = head;
        return head;

}
void printCircularList(Node* head) {
    if (head == NULL) {
        cout << "List is empty\n";
        return;
    }
     Node* temp = head;
    do {
        cout << temp->data << " ";
        temp = temp->next;
    } while (temp != head);
    cout << "\n";
}



int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
     Node* head = NULL;

    // Insert values at beginning
    head = insertAtBeginning(head, 30);
    head = insertAtBeginning(head, 20);
    head = insertAtBeginning(head, 10);

    // Print the circular linked list
    cout << "Circular Linked List: ";
    printCircularList(head);

    return 0;

    
    
    
    return 0;
}