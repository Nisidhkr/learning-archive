#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data ;
    Node *next;
    Node(int d){
        data = d;
        next = NULL;
    }
    /* data */
};
struct  Queue
{
    Node *front;
    Node *rear;
    Queue(){
        front = NULL;
        rear = NULL;
    }
    void enque(int valueToBeInserted){
        Node *temp = new Node (valueToBeInserted);
        if (front == NULL){
            front = rear = temp;
            return ;
        }
        rear->next = temp;
        rear = temp;
    }

    void dequeu(){
        if(front == NULL){
            return ;
        }
        Node *temp = front;
        front = front->next;
        if (front ==NULL){
            rear ==NULL;
        }
        delete temp;

    }

    /* data */
};




int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    Queue q;

    // Enqueue elements
    q.enque(10);
    q.enque(20);
    q.enque(30);
    q.enque(40);

    // Dequeue two elements
    q.dequeu();
    q.dequeu();

    // Print remaining queue
    Node* temp = q.front;
    cout << "Queue elements after operations: ";
    while (temp != NULL) {
        cout << temp->data << " ";
        temp = temp->next;
    }
    cout << "\n";

    return 0;
}