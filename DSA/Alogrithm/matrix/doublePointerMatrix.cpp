#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int m = 9, n = 10;
	int **arr;
	arr = new int *[m];
	for(int i = 0 ; i< m; i++){
		arr[i] = new int[i+1];
		

	}

	for (int i = 0 ; i<m ; i++){
		for (int j = 0 ; j<i+1 ; j++){
			arr[i][j] = sqrt(i*i + j*j);
			cout << arr[i][j]<< "             ";
		}
		cout << endl;
	}
}
