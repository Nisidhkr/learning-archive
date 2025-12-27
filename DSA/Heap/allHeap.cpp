#include <iostream>
using namespace std;

struct heap {
    int* arr;
    int size;
    int capacity;

    heap(int v) {
        arr = new int[v];
        size = 0;
        capacity = v;
    }

    int parent(int i) { return (i - 1) / 2; }
    int left(int i) { return (2 * i + 1); }
    int right(int i) { return (2 * i + 2); }

    void minheapify(int i) {
        int l = left(i);
        int r = right(i);
        int smallest = i;

        if (l < size && arr[l] < arr[smallest])
            smallest = l;
        if (r < size && arr[r] < arr[smallest])
            smallest = r;

        if (smallest != i) {
            swap(arr[i], arr[smallest]);
            minheapify(smallest);
        }
    }

    void insertKey(int key) {
        if (size == capacity) {
            cout << "Heap overflow\n";
            return;
        }
        size++;
        int i = size - 1;
        arr[i] = key;

        // Fix min heap property
        while (i != 0 && arr[parent(i)] > arr[i]) {
            swap(arr[i], arr[parent(i)]);
            i = parent(i);
        }
    }

    int extractMin() {
        if (size <= 0)
            return INT_MAX;
        if (size == 1) {
            size--;
            return arr[0];
        }

        int root = arr[0];
        arr[0] = arr[size - 1];
        size--;
        minheapify(0);

        return root;
    }

    void display() {
        for (int i = 0; i < size; i++)
            cout << arr[i] << " ";
        cout << endl;
    }
};

int main() {
    heap h(10);

    h.insertKey(3);
    h.insertKey(2);
    h.insertKey(15);
    h.insertKey(5);
    h.insertKey(4);
    h.insertKey(45);

    cout << "Heap elements: ";
    h.display();

    cout << "Extracted Min: " << h.extractMin() << endl;

    cout << "Heap after extractMin: ";
    h.display();

    return 0;
}