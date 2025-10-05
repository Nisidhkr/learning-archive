#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data ;
    Node *next;
    Node *prev;
    Node(int d){
        data = d;
        next = prev = NULL;
      

    }
    /* data */
};



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



    
    
    
    return 0;
}