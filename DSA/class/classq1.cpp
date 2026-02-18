# include <iostream>
using namespace std;

int sqroot(int n){
    int i = 0;
    while (i * i <= n) {
        i++;
    }
    return i - 1;
}
int main(){
    int n = 59;
    cout << sqroot(n)<< endl;
}