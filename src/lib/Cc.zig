// C com
pub fn c_str(z_str: []const u8) [*c]u8 {
    return @constCast(@ptrCast(z_str));
}

pub fn bool_from_int(int: i32) bool {
    return int == 1;
}

// usefull things i have learned
// this function would not work however if you hard code this without comptime and just
// put a type there it would littraly cast a type
// example below!

fn type_cast(comptime T: type, value: anytype) T {
    return @constCast(@ptrCast(value));
}

//fn loader() callconv(.C) ?*const fn ([*c]const u8) callconv(.c) ?*anyopaque {
    //return @constCast(@ptrCast(&c.glfwGetProcAddress));
//}