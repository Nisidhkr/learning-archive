#include <bits/stdc++.h>
using namespace std;
struct Point{
    int x ;
    int y ;
    void Print (Point p){
        cout << p.x << " "<< p.y<< endl ;
    }
};

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    Point p = {10,23};
    p.Print (p);
    
    
    
    return 0;
}