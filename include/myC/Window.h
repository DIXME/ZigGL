#pragma once
typedef struct {
    int width;
    int height;
    char* title;
    GLFWwindow* window;
} Window;

#define GLFW_INIT_FAILURE   -1
#define GLAD_INIT_FAILURE   -2
#define WINDOW_INIT_FAILURE -3
#define WINDOW_INIT_SUCSESS  1

int initWindow(Window* wn);
void currentContext(Window* wn);
void close();
int open(Window* wn);
void loop(Window* wn);

Window window(int width, int height, char* title);