#include <iostream>
using namespace std;

struct heapImplementation {
    int *arr;       // dynamic array
    int size;       // current number of elements
    int capacity;   // maximum capacity

    // Constructor
    heapImplementation(int c) {
        arr = new int[c];
        size = 0;
        capacity = c;
    }

    // Get parent index
    int parent(int i) { return (i - 1) / 2; }

    // Get left child index
    int left(int i) { return (2 * i + 1); }

    // Get right child index
    int right(int i) { return (2 * i + 2); }

    // Insert a new key into heap
    void insert(int key){
        if (size == capacity){
            cout << "Heap Overflow "<< endl;
            return;
        }
        size++;
        int i  = size-1;
        arr[i] = key;

        while (i!=0 && arr[parent(i)]>arr[i])
        {
            swap(arr[parent(i)], arr[i]);
            i = parent(i);
        }
        

    }
    void printHeap() {
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}
};

// Driver code
int main() {
    heapImplementation h(10);

    h.insert(3);
    h.insert(2);
    h.insert(15);
    h.insert(5);
    h.insert(4);
    h.insert(45);

    cout << "Heap elements: ";
    h.printHeap();

    // cout << "Extracted Min: " << h.extractMin() << endl;

    // cout << "Heap after extraction: ";
    // h.printHeap();

    // cout << "Current Min: " << h.getMin() << endl;

    return 0;
}
