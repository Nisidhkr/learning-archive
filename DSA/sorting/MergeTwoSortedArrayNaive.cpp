#include <bits/stdc++.h>
using namespace std;

void MergeTwoSortedArray(int arr1[], int arr2[], int sizeArray1, int sizeArray2) {
    int arr3[sizeArray1 + sizeArray2];

    // Copy arr1
    for (int i = 0; i < sizeArray1; i++) {
        arr3[i] = arr1[i];
    }

    // Copy arr2
    for (int i = 0; i < sizeArray2; i++) {
        arr3[sizeArray1 + i] = arr2[i];
    }

    // Sort merged array
    sort(arr3, arr3 + sizeArray1 + sizeArray2);

    // Print merged array
    cout << "Merged Sorted Array: ";
    for (int i = 0; i < sizeArray1 + sizeArray2; i++) {
        cout << arr3[i] << " ";
    }
    cout << "\n";
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int arr1[] = {1, 3, 5, 7};
    int arr2[] = {2, 4, 6, 8};
    int sizeArray1 = sizeof(arr1) / sizeof(arr1[0]);
    int sizeArray2 = sizeof(arr2) / sizeof(arr2[0]);


    MergeTwoSortedArray(arr1, arr2, sizeArray1, sizeArray2);

    return 0;
}
