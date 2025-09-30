#include <bits/stdc++.h>
using namespace std;
struct Point{
    int x;
    int y ;

};

int main() {
Point p = {12,34};
Point *ptr = &p;
cout<<ptr->x<<"  "<<ptr ->y<< endl;
ptr ->x = 100;
cout<<p.x<<endl;
cout <<ptr ->x;

    
    
    return 0;
}


//when we access using a pointer we use arow opereator 