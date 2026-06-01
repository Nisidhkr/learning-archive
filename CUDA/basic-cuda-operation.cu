#include <stdio.h>

// CUDA kernel (runs on GPU)
__global__ void add(int *a, int *b, int *c) {
    int i = threadIdx.x;   // thread index
    c[i] = a[i] + b[i];
}

int main() {
    int a[5] = {1, 2, 3, 4, 5};
    int b[5] = {10, 20, 30, 40, 50};
    int c[5];

    int *d_a, *d_b, *d_c;

    // Allocate memory on GPU
    cudaMalloc((void**)&d_a, 5 * sizeof(int));
    cudaMalloc((void**)&d_b, 5 * sizeof(int));
    cudaMalloc((void**)&d_c, 5 * sizeof(int));

    // Copy data from CPU → GPU
    cudaMemcpy(d_a, a, 5 * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, 5 * sizeof(int), cudaMemcpyHostToDevice);

    // Launch kernel with 1 block and 5 threads
    add<<<1, 5>>>(d_a, d_b, d_c);

    // Copy result back GPU → CPU
    cudaMemcpy(c, d_c, 5 * sizeof(int), cudaMemcpyDeviceToHost);

    // Print result
    for (int i = 0; i < 5; i++) {
        printf("%d ", c[i]);
    }
    printf("\n");

    // Free GPU memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    return 0;
}