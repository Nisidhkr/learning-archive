#include <iostream>
#include <vector>
using namespace std;

void addEdge(vector<int> adj[], int u, int v) {
    adj[u].push_back(v);
    adj[v].push_back(u);
}

void printGraph(vector<int> adj[], int v) {
    for (int i = 0; i < v; i++) {
        cout << i << " -> ";
        for (int x : adj[i]) {
            cout << x << " ";
        }
        cout << "\n";
    }
}

int main() {
    int v = 4;
    vector<int> adj[v];  // adjacency list

    addEdge(adj, 0, 1);
    addEdge(adj, 0, 2);
    addEdge(adj, 1, 3);
    addEdge(adj, 1, 2);

    printGraph(adj, v);

    return 0;
}