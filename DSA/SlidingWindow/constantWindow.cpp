#include <iostream>
#include <vector>
using namespace std;
// if the problem is of constant window we can take 2 pointer l and r
// finding the maximum sum of consecutive elements in an array
int main() {
    vector<int> v = {-1, 2, 3, 4, 5, -1};
    int k = 4;
    int n = v.size();

    int sum = 0;
    for (int i = 0; i < k; i++) {
        sum += v[i];
    }

    int maxsum = sum;

    for (int l = 0, r = k; r < n; l++, r++) {
        sum = sum - v[l] + v[r];
        maxsum = max(maxsum, sum);
    }

    cout << "Maximum sum of " << k << " consecutive elements is: " << maxsum << endl;

    return 0;
}
