#include <iostream>
using namespace std;

class heapImplementation
{
private:
    /* data */
public:
    int capacity ;
    int []arr ;
    int size;
    heapImplementation(int data){
        capacity = data;
        size = 0;

        arr = new int[capacity];
    }
    int parent (int i){
        return (i-1)/2;

    }

    int left(int i ){
        return (2*i+1);
    } 
    int right(int i ){
        return (2*i+2);

    }
    
};



