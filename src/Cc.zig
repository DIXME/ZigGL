// C com
pub fn c_str(z_str: []const u8) [*c]u8 {
    return @constCast(@ptrCast(z_str));
}
