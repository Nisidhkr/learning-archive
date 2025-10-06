#include <bits/stdc++.h>
using namespace std;
struct Node{
    int data;
    Node *next;
    Node(int data){
        this->data = data;
        next = NULL;
    }
};
 void middleLinkedList(Node*head){
    if(head == NULL) {
        return ;
    }
    Node *curr = head;
    int size= 0;
    for (curr; curr->next !=NULL;curr= curr->next){
        size++;
    }
    curr = head;
    for(int i =0; i<size/2; i++){
        curr = curr->next;
       

    }
     cout<< curr->data;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    // Creating a sample linked list: 10 -> 20 -> 30 -> 40 -> 50
    Node* head = new Node(10);
    head->next = new Node(20);
    head->next->next = new Node(30);
    head->next->next->next = new Node(40);
    head->next->next->next->next = new Node(50);

    middleLinkedList(head);

    return 0;
}
