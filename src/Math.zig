const v = @import("Vectors.zig");

// oparator overloading would look SO much cleaner, however this is what we have to do 😔

pub fn lerp(a: i32, b: i32, t: i32) i32 {
    return a + t * (b - a);
}

pub fn lerp2(a: v.Vec2, b: v.Vec2, t: i32) v.Vec2 {
    return v.Vec2.add(a, v.Vec2.mulI(t, v.Vec2.sub(a, b)));
}

pub fn lerp3(a: v.Vec3, b: v.Vec3, t: i32) v.Vec3 {
    return v.Vec3.add(a, v.Vec3.mulI(t, v.Vec3.sub(a, b)));
}

