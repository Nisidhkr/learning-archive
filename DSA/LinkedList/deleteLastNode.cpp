#include <bits/stdc++.h>
using namespace std;
struct Node{
    int data;
    Node *next;
    Node(int x){
        data = x;
        next = NULL;
    }
};
Node *deleteLast(Node *head){
    if (head == NULL){
        return NULL;
    }
    if (head->next==NULL){
        delete head;
        return NULL;
    }
    Node *curr= head;
    while(curr->next->next!=NULL){
        curr = curr->next;
    }
     delete curr->next;
     curr->next = NULL;
       return head;
 

}
void printlist(Node *head){
    while(head!=NULL){
        cout<<head->data<< " ";
        head= head->next;
    }
    cout<< "\n";
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = new Node (1001);
    head->next = new Node (1085);
    head->next->next = new Node (1585);
    cout << "without deltion\n";
    printlist(head);
    head = deleteLast(head);
    cout << "With deletion\n";
    printlist(head);
    
    return 0;
}