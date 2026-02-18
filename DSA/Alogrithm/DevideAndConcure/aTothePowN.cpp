#include <iostream>
using namespace std;

int fun(int n, int a){
	if(n<1) return 1;

	return a*fun(n-1,a);
}

int main(){

	int n = 2;
	int a = 2;
	cout<<fun(n,a)<< endl;
}

