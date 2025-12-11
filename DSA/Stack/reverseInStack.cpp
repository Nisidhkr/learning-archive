# include <iostream>
# include <stack>
using namespace std;

void  reverseString(string &str){
        stack<char> st;
        for (int i = 0 ; i<str.length(); i++){
            st.push(str[i]);
        }
        while(st.empty()== false){
            cout << st.top();
            st.pop();
        }
}

int main() {
    string str;
    cout << "Enter a string: ";
    getline(cin, str);

    cout << "Reversed string: ";
    reverseString(str);

    return 0;
}
