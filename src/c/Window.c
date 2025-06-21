#include"glad/glad.h"
#include"GLFW/glfw3.h"
#include"myC/Window.h"
#include"stdio.h"

int initWindow(Window* wn){
    if(!glfwInit()){
        printf("[-] glfw failed to initalize!\n");
        return GLFW_INIT_FAILURE;
    };
    wn->window = glfwCreateWindow(wn->width,wn->height,wn->title,NULL,NULL);
    if(!wn->window){
        printf("[-] window failed to initalize!\n");
        return WINDOW_INIT_FAILURE;
    };
    currentContext(wn);
    if(!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)){
        printf("[-] glad failed to initalize!\n");
        return GLAD_INIT_FAILURE;
    };
    return WINDOW_INIT_SUCSESS;
};

void currentContext(Window* wn){
    glfwMakeContextCurrent(wn->window);
};

void close(){
    glfwTerminate();
};

int open(Window* wn){
    return !glfwWindowShouldClose(wn->window);
};

void loop(Window* wn){
    glfwPollEvents();
    glfwSwapBuffers(wn->window);
};

Window window(int width, int height, char* title){
    Window wn = { .width = width, .height = height, .title = title };
    return wn;
}