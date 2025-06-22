const std = @import("std");
const cc = @import("ccom");
const w = @import("window");
const c = @cImport({
    @cInclude("glad/glad.h");
    @cInclude("GLFW/glfw3.h");
});

pub fn main() !void {
    var window: w.Window = .{
        .width = 640,
        .height = 450,
        .title = "tuf0f",
        .window = null
    };
    if(window.init()!=w.WINDOW_INIT_SUCSESS){
        std.debug.print("[-] window was not initalized now exiting", .{});
        return;
    }
    while(window.open()){
        c.glClearColor(0.5, 0.5, 0.6, 1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT);
        window.loop();
    }
    window.close();
}