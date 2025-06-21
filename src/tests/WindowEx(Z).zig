const std = @import("std");
const cc = @import("Cc.zig");
const w = @import("Window.zig");
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
        window.loop();
    }
    window.close();
}