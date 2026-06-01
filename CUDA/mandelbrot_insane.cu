#include <GL/glew.h>
#include <GL/glut.h>
#include <cuda_runtime.h>
#include <cuda_gl_interop.h>
#include <stdio.h>
#include <math.h>


#define WIDTH 1000
#define HEIGHT 800
#define MAX_ITER 1500

GLuint pbo;
struct cudaGraphicsResource *cuda_pbo_resource;

double zoom = 1.0;
double offsetX = -0.5;
double offsetY = 0.0;

int useJulia = 0;
double julia_cx = -0.7;
double julia_cy = 0.27015;

int autoZoom = 0;
float fps = 0;
int frameCount = 0;
int lastTime = 0;

// 🎯 CUDA Kernel
__global__ void render(unsigned char *img, double zoom, double offsetX, double offsetY,
                       int useJulia, double jcx, double jcy) {

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= WIDTH || y >= HEIGHT) return;

    int idx = (y * WIDTH + x) * 3;

    double real = (x - WIDTH/2.0) * (4.0 / WIDTH) / zoom + offsetX;
    double imag = (y - HEIGHT/2.0) * (4.0 / WIDTH) / zoom + offsetY;

    double zr = useJulia ? real : 0.0;
    double zi = useJulia ? imag : 0.0;

    double cr = useJulia ? jcx : real;
    double ci = useJulia ? jcy : imag;

    int i;
    for (i = 0; i < MAX_ITER; i++) {
        double zr2 = zr*zr, zi2 = zi*zi;
        if (zr2 + zi2 > 4.0) break;

        zi = 2.0*zr*zi + ci;
        zr = zr2 - zi2 + cr;
    }

    // Smooth coloring
    double smooth = i + 1 - log2(log2(zr*zr + zi*zi));
    double t = smooth / MAX_ITER;

    int r = (int)(9*(1-t)*t*t*t * 255);
    int g = (int)(15*(1-t)*(1-t)*t*t * 255);
    int b = (int)(8.5*(1-t)*(1-t)*(1-t)*t * 255);

    img[idx]     = r;
    img[idx + 1] = g;
    img[idx + 2] = b;
}

// 🎨 Display
void display() {
    unsigned char *d_img;

    cudaGraphicsMapResources(1, &cuda_pbo_resource, 0);
    cudaGraphicsResourceGetMappedPointer((void**)&d_img, NULL, cuda_pbo_resource);

    dim3 threads(16,16);
    dim3 blocks((WIDTH+15)/16, (HEIGHT+15)/16);

    render<<<blocks, threads>>>(d_img, zoom, offsetX, offsetY, useJulia, julia_cx, julia_cy);

    cudaDeviceSynchronize();  // 🔥 important

    cudaGraphicsUnmapResources(1, &cuda_pbo_resource, 0);

    glClear(GL_COLOR_BUFFER_BIT);

    // 🔥 CRITICAL FIXES
    glRasterPos2i(-1, -1);  // set draw position

    glBindBuffer(GL_PIXEL_UNPACK_BUFFER, pbo);

    glDrawPixels(WIDTH, HEIGHT, GL_RGB, GL_UNSIGNED_BYTE, 0);

    glBindBuffer(GL_PIXEL_UNPACK_BUFFER, 0);

    glutSwapBuffers();

    glutPostRedisplay();
}

// 🎮 Keyboard
void keyboard(unsigned char key, int, int) {
    switch (key) {
        case 'w': offsetY -= 0.05/zoom; break;
        case 's': offsetY += 0.05/zoom; break;
        case 'a': offsetX -= 0.05/zoom; break;
        case 'd': offsetX += 0.05/zoom; break;
        case '+': zoom *= 1.5; break;
        case '-': zoom /= 1.5; break;
        case 'j': useJulia = !useJulia; break;
        case ' ': autoZoom = !autoZoom; break;
        case 27: exit(0);
    }
}

// 🖱️ Mouse zoom
void mouse(int button, int state, int x, int y) {
    if (state == GLUT_DOWN) {
        double mx = (x - WIDTH/2.0) * (4.0 / WIDTH) / zoom;
        double my = (y - HEIGHT/2.0) * (4.0 / WIDTH) / zoom;

        offsetX += mx;
        offsetY += my;

        if (button == GLUT_LEFT_BUTTON) zoom *= 1.5;
        if (button == GLUT_RIGHT_BUTTON) zoom /= 1.5;
    }
}

// 🧠 Init CUDA-OpenGL buffer
void initPBO() {
    glGenBuffers(1, &pbo);
    glBindBuffer(GL_PIXEL_UNPACK_BUFFER, pbo);
    glBufferData(GL_PIXEL_UNPACK_BUFFER, WIDTH*HEIGHT*3, NULL, GL_DYNAMIC_DRAW);
    glBindBuffer(GL_PIXEL_UNPACK_BUFFER, 0);

    cudaGraphicsGLRegisterBuffer(&cuda_pbo_resource, pbo, cudaGraphicsMapFlagsWriteDiscard);
}

// 🚀 Main
int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(WIDTH, HEIGHT);
    glutCreateWindow("CUDA Fractal Engine");
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glewInit();
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glClearColor(0.0, 0.0, 0.0, 1.0);

    initPBO();

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0, WIDTH, 0, HEIGHT);

    glutDisplayFunc(display);
    glutKeyboardFunc(keyboard);
    glutMouseFunc(mouse);

    glutMainLoop();
    return 0;
}