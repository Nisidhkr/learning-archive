#include <stdio.h>
#include <stdlib.h>

#define WIDTH 800
#define HEIGHT 600

#define MAX_ITER 2000

__global__ void mandelbrot(unsigned char *img) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= WIDTH || y >= HEIGHT) return;

    int pixel = y * WIDTH + x;

    double real = (x - WIDTH/2.0) * 4.0 / WIDTH - 0.75;
    double imag = (y - HEIGHT/2.0) * 4.0 / WIDTH;

    double zr = 0.0, zi = 0.0;
    int i;

    for (i = 0; i < MAX_ITER; i++) {
        double temp = zr*zr - zi*zi + real;
        zi = 2.0 * zr * zi + imag;
        zr = temp;

        if (zr*zr + zi*zi > 4.0) break;
    }

    int color = (int)(255.0 * i / MAX_ITER);
    img[pixel] = color;
}

int main() {
    unsigned char *img;
    unsigned char *d_img;

    size_t size = WIDTH * HEIGHT * sizeof(unsigned char);
    img = (unsigned char*)malloc(size);

    cudaMalloc(&d_img, size);

    dim3 threads(16, 16);
    dim3 blocks(WIDTH/16, HEIGHT/16);

    mandelbrot<<<blocks, threads>>>(d_img);

    cudaMemcpy(img, d_img, size, cudaMemcpyDeviceToHost);

    // Save as PGM image
    FILE *f = fopen("output.pgm", "w");
    fprintf(f, "P3\n%d %d\n255\n", WIDTH, HEIGHT);

    for (int i = 0; i < WIDTH * HEIGHT; i++) {
        int val = img[i];
        fprintf(f, "%d %d %d ", val, val/2, 255 - val);
    }

    fclose(f);

    cudaFree(d_img);
    free(img);

    printf("Image generated: output.pgm\n");
    return 0;
}