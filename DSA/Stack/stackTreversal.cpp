# include <iostream>
# include <stack>
using namespace std;
int main (){
    stack <int> s ;
    s.push(78);
    s.push(89);
    s.push(74);
    s.push(79);
    while (s.empty() == false){
        cout << s.top()<< " ";
        s.pop ();
    }

}