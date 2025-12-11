# include <iostream>
# include <stack>
#include <vector>
using namespace std;


void  storckSpan(vector<int>arr){
    int span=1;
   for (int i = 0 ; i <arr.size(); i++){
    int j ;
    for (int j = i-1; j>= 0 ; j--){
        if (arr[j]<= arr[i]){
            span ++;
        }
        else 
         break;
         
    }
    cout << span<< " ";
   }

}
int main (){
    vector <int> arr = {1,23,4,2,15,17, 7,10,9, 16, 20, 45};
    for (int i = 0 ;i<arr.size();i++){
        cout << arr[i]<< " ";
    }
    cout << endl;
    storckSpan(arr);
    return 0 ;
}