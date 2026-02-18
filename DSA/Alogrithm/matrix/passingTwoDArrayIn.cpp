#include <iostream>
using namespace std;    
void printMatrix(int **arr, int m , int n){
    for(int i = 0 ; i<m ; i++){
        for (int j = 0 ; j<n; j++){
            cout << arr[i][j]<< " ";
        }

        cout << endl;
    }
}
int main(){
    int m = 4 , n = 5;
    int **arr;
    arr = new int *[m];
    for ( int i = 0 ; i<m ; i++){
        arr[i] = new int [n];
        for(int j = 0 ; j<n ; j++){

            arr[i][j] = i*j;
        }
    }
    printMatrix(arr, m, n);
    return 0;
}