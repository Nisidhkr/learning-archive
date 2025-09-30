# include <iostream>
using namespace std;
struct Node 
{
    /* data */
    int value;
    Node *next;
    Node (int x ){
        value = x ;
        next = NULL;
    }
};
int searchFun(Node *head,int valueToFind){
    Node *current = head;
    int count = 1;
    while(current!= NULL){
        if(current->value == valueToFind){
            return count;
        }
        else{
            current = current ->next;
            count++;
        }
    }
    return -1;
}
int main(){
    Node *head = new Node(100);
    head ->next = new Node(15);
    head ->next->next = new Node(1485);
    cout<<searchFun(head , 1001);
return 0;
}