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
void printList(Node *head){
    if (head == NULL){
        return ;
    }
    Node *temp = head;
    do{
        cout << temp-> data<<"->";
        temp = temp->next;
    }
    while(temp !=head);

}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
      Node* head = new Node(10);
    Node* second = new Node(20);
    Node* third = new Node(30);
    Node* fourth = new Node(40);

    // 🔗 Link nodes circularly
    head->next = second;
    second->next = third;
    third->next = fourth;
    fourth->next = head; // circular link

    // 🖨 Print the circular list
    printList(head);

    // 🧹 Optional cleanup (not mandatory for small demo)
    delete head;
    delete second;
    delete third;
    delete fourth;

    return 0;

    
    
    
    return 0;
}