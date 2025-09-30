#include <bits/stdc++.h>
using namespace std;
struct Point {
    int x ;
    int y ;

};

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Point arr[5];

    for(int i = 0 ; i <5 ; i ++){
        arr[i].x = i;
        arr[i].y = i*10;
    }
    for(int i = 0 ; i <5 ; i++){
        cout << arr[i].x<<"  "<<arr[i].y<< endl;
    }
    
    // like normal variable we acan also access individual point s in an array by using index
    Point p = arr[1];
    cout<<"like normal variable we acan also access individual point s in an array by using index \n";
    cout << p.x << " "<< p.y; 
    return 0;
}