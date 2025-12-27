#include <iostream>
using namespace std;

struct heap{
    int* arr;
    int size;
    int capacity;
    heap(int v){
    	arr = new int [v];
	size = 0;
	capacity = v;
    }
    int parent(int i ) return(i -1/2);
    int left(int i ) return (2*i +1);
    int right(int i ) return (2*1+2);
    void minheap(int i){
    	int l = left(i);
	int r = right(i);
	int smallest = i ;
	if (l < size && arr[l] < arr[smallest])
		smallest = l;
	if (r <size && arr [r] < arr[smallest])
		smallest = r;
	if (smallest!= i ){
		swap (arr[i], arr[smallest]);
		minheap(smallest);
	}
    
    }
};
