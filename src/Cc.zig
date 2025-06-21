// C com
pub fn c_str(z_str: []const u8) [*c]u8 {
    return @constCast(@ptrCast(z_str));
}

pub fn bool_from_int(int: i32) bool {
    return int == 1;
}