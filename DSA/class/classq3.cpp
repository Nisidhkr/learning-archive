#include <iostream>
using namespace std;

int main() {
    string s = "My name is ";
    string word = "";

    for (int i = s.length() - 1; i >= 0; i--) {
        if (s[i] == ' ') {
            cout << word << " ";
            word = "";
        } else {
            word = s[i] + word;
        }
    }
    cout << word<<endl;
}
