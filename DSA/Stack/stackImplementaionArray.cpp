#include <bits/stdc++.h>
using namespace std;
struct MyStack
{
    int *arr;
    int cap;
    int top ;
    MyStack(int c){
        cap = c;
        arr = new int[cap];
        top = -1; 
    }


    void push(int x){
        if (top==cap-1){
            cout << "stack is full";
        }
        else{
            top++;
            arr[top]=x;
        }
    }

    int pop(){
        if(top == -1){
            cout << "stack is already empty";
            return INT16_MIN;
        }
        else{
            int res = arr[top];
            top--;
            return res;
        }
    }
    int peek(){
        if(top==-1){
            cout<<"stack is empty so there is no elemnt to peek ";
            return INT16_MIN;
        }
        return arr[top];
    }
    int size(){
        return (top+1);
    }
    bool isEmpty(){
        return (top==-1);
    }
};
void printStack(MyStack &stack) {
    for (int i = 0; i <= stack.top; i++) {
        cout << stack.arr[i] << " ";
    }
    cout << endl;
}
int main() {
    ios::sync_with_stdio(false); 
    cin.tie(nullptr);
    MyStack obj (10);
    obj.push(11);
    obj.push(12);
    obj.push(13);
    obj.push(14);
    obj.push(15);
    cout << obj.pop()<< endl;
    cout << obj.size()<< endl;
    cout << obj.peek()<<endl;
    cout << obj.isEmpty()<<endl;

    printStack(obj);
    
    
    return 0;
}