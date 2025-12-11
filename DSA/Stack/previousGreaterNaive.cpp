# include <iostream>
# include <vector>
using namespace std;
void prevGreater(vector <int > arr ){
    for (int i = 0 ; i<arr.size();i++){
        int j;
        for ( j = i -1; j >=0 ; j--){
            if (arr[j]>arr[i]){
                cout << arr[j]<<" ";
                break;
            }
            
        }
        if (j == -1){
                cout << -1 << " ";
            }
    }
}
int main (){
    vector <int > arr = {1,3,5,2,6,8,7,9};
    for (int i = 0 ;i<arr.size();i++){
        cout << arr[i]<< "  ";
    }
    cout << endl;
    prevGreater(arr);

}