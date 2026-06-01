#include <GL/glut.h>
#include <cuda_runtime.h>

#define WIDTH 800
#define HEIGHT 600
#define MAX_ITER 5000

unsigned char *d_img;
unsigned char *h_img;

double zoom = 1.0;
double offsetX = -0.5;
double offsetY = 0.0;

// CUDA kernel
__global__ void mandelbrot(unsigned char *img, double zoom, double offsetX, double offsetY) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= WIDTH || y >= HEIGHT) return;

    int idx = (y * WIDTH + x) * 3;

    double real = (x - WIDTH/2.0) * (4.0 / WIDTH) / zoom + offsetX;
    double imag = (y - HEIGHT/2.0) * (4.0 / WIDTH) / zoom + offsetY;

    double zr = 0.0, zi = 0.0;
    int i;

    for (i = 0; i < MAX_ITER; i++) {
        double zr2 = zr*zr, zi2 = zi*zi;
        if (zr2 + zi2 > 4.0) break;

        zi = 2.0 * zr * zi + imag;
        zr = zr2 - zi2 + real;
    }

    // 🎯 Smooth coloring
    double smooth = i + 1 - log2(log2(zr*zr + zi*zi));

    double t = smooth / MAX_ITER;

    // 🎨 Neon gradient
    int r = (int)(9*(1-t)*t*t*t * 255);
    int g = (int)(15*(1-t)*(1-t)*t*t * 255);
    int b = (int)(8.5*(1-t)*(1-t)*(1-t)*t * 255);

    img[idx]     = r;
    img[idx + 1] = g;
    img[idx + 2] = b;
}

void mouse(int button, int state, int x, int y) {
    if (state == GLUT_DOWN) {
        double mx = (x - WIDTH/2.0) * (4.0 / WIDTH) / zoom;
        double my = (y - HEIGHT/2.0) * (4.0 / WIDTH) / zoom;

        offsetX += mx;
        offsetY += my;

        if (button == GLUT_LEFT_BUTTON) zoom *= 1.5;
        if (button == GLUT_RIGHT_BUTTON) zoom /= 1.5;

        glutPostRedisplay();
    }
}


// Render function
void display() {
    dim3 threads(16, 16);
    dim3 blocks(WIDTH/16, HEIGHT/16);

    mandelbrot<<<blocks, threads>>>(d_img, zoom, offsetX, offsetY);

    cudaMemcpy(h_img, d_img, WIDTH * HEIGHT * 3, cudaMemcpyDeviceToHost);

    glClear(GL_COLOR_BUFFER_BIT);
    glDrawPixels(WIDTH, HEIGHT, GL_RGB, GL_UNSIGNED_BYTE, h_img);
    glutSwapBuffers();
}

// Keyboard controls
void keyboard(unsigned char key, int, int) {
    switch (key) {
        case 'w': offsetY -= 0.05 / zoom; break;
        case 's': offsetY += 0.05 / zoom; break;
        case 'a': offsetX -= 0.05 / zoom; break;
        case 'd': offsetX += 0.05 / zoom; break;
        case '+': zoom *= 1.5; break;
        case '-': zoom /= 1.5; break;
        case 27: exit(0); // ESC
    }
    glutPostRedisplay();
}

int main(int argc, char** argv) {
    h_img = (unsigned char*)malloc(WIDTH * HEIGHT * 3);
    cudaMalloc(&d_img, WIDTH * HEIGHT * 3);

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(WIDTH, HEIGHT);
    glutCreateWindow("CUDA Mandelbrot Explorer");

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, WIDTH, 0, HEIGHT);

    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);

    glutMainLoop();

    cudaFree(d_img);
    free(h_img);
    return 0;
}