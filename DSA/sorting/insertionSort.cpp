#include <bits/stdc++.h>
using namespace std;
int fun(){
    for(int i = 1 ;i<n ; i++){
        int key = arr[i];
        int j = i-1;
        while(j>=0&&arr[j]>key){
            arr[j+1] = arr[j];
             j--;
        }
        arr[j+1] =key;
    }

}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
    
    
    return 0;
}