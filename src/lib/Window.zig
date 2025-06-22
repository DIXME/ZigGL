const c = @cImport({
    @cInclude("glad/glad.h");
    @cInclude("GLFW/glfw3.h");
});

const std = @import("std");
const cc = @import("ccom");

pub const GLFW_INIT_FAILURE:   i32 = -1;
pub const GLAD_INIT_FAILURE:   i32 = -2;
pub const WINDOW_INIT_FAILURE: i32 = -3;
pub const WINDOW_INIT_SUCSESS: i32 =  1;

fn loader() callconv(.C) ?*const fn ([*c]const u8) callconv(.c) ?*anyopaque {
    return @constCast(@ptrCast(&c.glfwGetProcAddress));
}

pub const Window = struct {
    width: i32,
    height: i32,
    title: []const u8,
    window: ?*c.GLFWwindow,
    pub fn currentContext(wn: *Window) void {
        c.glfwMakeContextCurrent(wn.window);
    }
    pub fn init(wn: *Window) i32 {
        if(!cc.bool_from_int(c.glfwInit())){
            std.debug.print("[-] glfw failed to initalize!\n", .{});
            return GLFW_INIT_FAILURE;
        }
        wn.window = c.glfwCreateWindow(wn.width,wn.height,cc.c_str(wn.title),null,null);
        if(wn.window==null){
            std.debug.print("[-] window failed to initalize!\n", .{});
            return WINDOW_INIT_FAILURE;
        }
        wn.currentContext();
        if(!cc.bool_from_int(c.gladLoadGLLoader(loader()))){
            std.debug.print("[-] glad failed to initalize!\n", .{});
            return GLAD_INIT_FAILURE;
        }
        return WINDOW_INIT_SUCSESS;
    }
    pub fn close(wn: *Window) void {
        c.glfwTerminate();
        // do this beacuse we dont want zig to wine (we want this to be a method, thus is needs a self param)
        wn.width = wn.width;
    }
    pub fn open(wn: *Window) bool {
        return !cc.bool_from_int(c.glfwWindowShouldClose(wn.window));
    }
    pub fn loop(wn: *Window) void {
        c.glfwPollEvents();
        c.glfwSwapBuffers(wn.window);
    }
};