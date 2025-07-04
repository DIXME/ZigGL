const std = @import("std");
const cc = @import("ccom");
const c = @cImport({
    @cInclude("glad/glad.h");
    @cInclude("GLFW/glfw3.h");
    @cInclude("myC/Window.h");
});
pub fn main() void {
    std.debug.print("running\n", .{});
    var win: c.Window = c.window(640, 500, cc.c_str("pmo"));
    const init: i32 = c.initWindow(&win);
    if (init != c.WINDOW_INIT_SUCSESS) {
        // logs the error if somthing goes wrong
        // return types: c.GLAD_INIT_FAILURE c.GLFW_INIT_FAILURE c.WINDOW_INIT_FAILURE (all c_int's or i32's)
        return;
    }
    while (c.open(&win) == 1) {
        c.glClearColor(0.1, 0.1, 0.1, 1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT);

        c.loop(&win);
    }
    c.close();
}
