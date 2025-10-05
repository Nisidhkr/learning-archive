# include <iostream>
using namespace std;
void noFrom1toN(int n){
    if(n <=0 ){
        return;
    }
    
    noFrom1toN(n-1);

    cout << n<<endl;
    

}
int main(){
    int n ;
    cout << "Enter the no till you want the counting \n";
    cin >> n;
    noFrom1toN(n);
}