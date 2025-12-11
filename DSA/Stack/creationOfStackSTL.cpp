# include <iostream>
# include <stack>
using namespace std;

int main(){
    stack<int> st;
    st.push(10);
    st.push(49);
    st.push(780);
    cout<< st.size()<< endl;
    cout<< st.top()<< endl;
    st.pop();
    cout<< st.size()<< endl;

}