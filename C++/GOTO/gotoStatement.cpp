#include <iostream>
using namespace std;

int main() {
    int x = 0;

    if (x == 0)
        goto skip;

    cout << "This line will be skipped.\n";

skip:
    cout << "Jumped to label 'skip'.\n";

    return 0;
}
