#include <iostream>
using namespace std;        

bool palindromeChecker(int x){
    int rev = 0;
    int temp = x;
    while (x!=0){
        int digit = x % 10;
        rev = rev*10 + digit;
        x = x/10;
    
    }
    return (rev == temp);
}

int main(){
    int x;
    cout << "enter the value to check for palindrome\n";
    cin >> x;
    cout << palindromeChecker(x)<< endl;
    return 0;

}