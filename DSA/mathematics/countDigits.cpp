#include <iostream>
using namespace std;

int countDigits(int x){
int count= 0;
    while(x!=0){
    
        x= x/10;
        count++;
        
    }
    return count;

}
int main(){
    cout << "Enter the number to count the digits\n";
    int x;
    cin >> x;
    cout << countDigits(x)<< endl;
    return 0;

}