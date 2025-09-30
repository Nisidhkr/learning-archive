#include <bits/stdc++.h>
using namespace std;

void selectionSort(int arr[], int n) {
    int temp[n];

    for(int i = 0; i < n; i++) {
        int min_ind = 0;

        for(int j = 1; j < n; j++) {
            if(arr[j] < arr[min_ind]) {
                min_ind = j;
            }
        }

        temp[i] = arr[min_ind];
        arr[min_ind] = INT_MAX;   // INF replaced with INT_MAX
    }

    for(int i = 0; i < n; i++) {
        arr[i] = temp[i];
    }
}

int main() {
    int arr[] = {64, 25, 12, 22, 11};
    int n = sizeof(arr) / sizeof(arr[0]);

    selectionSort(arr, n);

    cout << "Sorted array: ";
    for(int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}
