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
void Printlist(Node *head){
    if (head == NULL){
        return;
    }
    cout << head->data;
    cout << " -> ";
    for (Node *temp = head->next;temp !=head;temp = temp->next){
        cout << temp->data<< " -> ";
       
    }
    

}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = new Node(199);
    head -> next  = new Node (45);
    head->next->next = new Node (78);
    head-> next->next->next = head; 
    Printlist(head);
    
    
    
    return 0;
}