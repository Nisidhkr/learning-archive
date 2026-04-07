#include <iostream>
using namespace std;
int main()
{
    int v,e;
    cout<<"Enter the number of vertices and edges: ";
    cin>>v>>e;
    int adj[v][v] = {0}; 
    int a,b;
    for(int i = 0; i<e; i++){
        cout<<"Enter the vertices of edge "<<i+1<<": ";
        cin>>a>>b;

        adj[a][b] = 1;
        adj[b][a] = 1;
    }
    return 0;
}