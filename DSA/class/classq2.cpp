#include <iostream>
using namespace std;


int missingNumber(int arr[], int n) {
    int total = n * (n + 1) / 2;
    int sum = 0;

    for (int i = 0; i < n - 1; i++)
        sum += arr[i];

    return total - sum;
}

int main() {
    int n = 5;
    int arr[] = {1, 2, 4, 5};

    cout << "Missing number is: " << missingNumber(arr, n)<< endl;

    return 0;
}