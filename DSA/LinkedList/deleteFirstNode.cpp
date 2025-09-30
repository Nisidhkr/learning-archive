#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data;
    Node *next;
    Node(int x ){
        data = x;
        next = NULL;
    }
};

Node *deleteFirstNode(Node *head){
    if(head==NULL){
        return NULL;
    }
    else {
        Node *temp = head->next;
        delete head;
        return temp;
    }

}
void printlist(Node *head){
    Node *curr = head;
    while (curr!= NULL)
    {
        cout << curr->data<<"--";
        curr = curr->next;
    }
    
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Node *head = new Node (193);
    head->next = new Node (458);
    head->next->next = new Node(597);
    head = deleteFirstNode(head);
    printlist(head);
    

    
    return 0;
}