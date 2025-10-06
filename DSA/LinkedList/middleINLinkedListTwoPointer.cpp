#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data;
    Node*next;
    Node(int data){
        this->data = data;
        next = NULL;
    }
};
void middleLinkedList(Node*head){
    Node *slow = head;
    Node *fast = head;
 
    while (fast!=NULL & fast->next !=NULL)
    {
        slow =  slow->next;
        fast =  fast->next ->next;
        /* code */
    }
    cout << "Middle element: " << slow->data << "\n";

    
}
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    // Creating a sample linked list: 1 → 2 → 3 → 4 → 5
    Node* head = new Node(1);
    head->next = new Node(2);
    head->next->next = new Node(3);
    head->next->next->next = new Node(4);
    head->next->next->next->next = new Node(5);

    middleLinkedList(head);

    return 0;
}


