#include <stdio.h>

struct code {
    int i;
    char c;
    struct code *ptr;
};

int main() {
    struct code var1;
    struct code var2;

    // Initialize var1
    var1.i = 65;
    var1.c = 'A';
    var1.ptr = NULL;

    // Initialize var2
    var2.i = 66;
    var2.c = 'B';
    var2.ptr = NULL;

    // Link var1.ptr to var2
    var1.ptr = &var2;

    // Print values from var2 using var1's pointer
    printf("var1.ptr->i = %d\n", var1.ptr->i);
    printf("var1.ptr->c = %c\n", var1.ptr->c);

    return 0;
}