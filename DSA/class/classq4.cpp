# include<iostream>
using namespace std;



bool isDivisibleBy4(int n) {
    return n % 4 == 0;
}

int main(){
    int n = 55;
    cout << isDivisibleBy4(n)<< endl;
}