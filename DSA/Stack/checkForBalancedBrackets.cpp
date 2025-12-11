# include <iostream>
# include <stack>
using namespace std;
bool matching(char a , char b){
    return (char a== '(' && char b== ')'|| char a == '{'  && char b == '}' || char a == '[' && char b == ']');
}

bool isBalanced(char &str){
        stack <int> s;
        for (int i = 0 ; brackets.size(); i++){
            if (str[i]=='('|| str[i]=='{'|| str[i] == '['){
                s.push(str[i]);
            }
            else 
                


        }
}