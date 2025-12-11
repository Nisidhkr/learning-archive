# include <iostream>
# include <vector>
using namespace std;
int printFun(vector<int> v){
    for (int i = 0; i<v.size(); i++){
        return v[i];
    }
}

int main(){

    vector <int>  v;
    v.push_back(12);
    v.push_back(17);
    v.push_back(19);
    v.push_back(11);
    cout<<printFun(v);
}