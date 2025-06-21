const std = @import("std");

// opI is a vector with an intager int the order (i32 vector);
// opS is a pointer to a vecctor and a vector (self, vector);

pub const Vec3 = struct {
    x: i32,
    y: i32,
    z: i32,
    
    pub fn add(a: Vec3, b: Vec3) Vec3 {
        return Vec3{
            .x = a.x+b.x,
            .y = a.y+b.y,
            .z = a.z+b.z
        };
    }

    pub fn sub(a: Vec3, b: Vec3) Vec3 {
        return Vec3{
            .x = a.x-b.x,
            .y = a.y-b.y,
            .z = a.z-b.z
        };
    }

    pub fn div(a: Vec3, b: Vec3) Vec3 {
        return Vec3{
            .x = a.x/b.x,
            .y = a.y/b.y,
            .z = a.z/b.z
        };
    }

    pub fn mul(a: Vec3, b: Vec3) Vec3 {
        return Vec3{
            .x = a.x*b.x,
            .y = a.y*b.y,
            .z = a.z*b.z
        };
    }

    pub fn addI(a: i32, b: Vec3) Vec3 {
        return Vec3{
            .x = a+b.x,
            .y = a+b.y,
            .z = a+b.z
        };
    }

    pub fn subI(a: i32, b: Vec3) Vec3 {
        return Vec3{
            .x = a-b.x,
            .y = a-b.y,
            .z = a-b.z
        };
    }

    pub fn divI(a: i32, b: Vec3) Vec3 {
        return Vec3{
            .x = a/b.x,
            .y = a/b.y,
            .z = a/b.z
        };
    }

    pub fn mulI(a: i32, b: Vec3) Vec3 {
        return Vec3{
            .x = a*b.x,
            .y = a*b.y,
            .z = a*b.z
        };
    }

    pub fn addS(a: *Vec3, b: Vec3) Vec3 {
        a.x += b.x;
        a.y += b.y;
        a.z += b.z;
    }

    pub fn subS(a: *Vec3, b: Vec3) Vec3 {
        a.x -= b.x;
        a.y -= b.y;
        a.z -= b.z;
    }

    pub fn divS(a: *Vec3, b: Vec3) Vec3 {
        a.x /= b.x;
        a.y /= b.y;
        a.z /= b.z;
    }

    pub fn mulS(a: *Vec3, b: Vec3) Vec3 {
        a.x *= b.x;
        a.y *= b.y;
        a.z *= b.z;
    }
};

pub const Vec2 = struct {
    x: i32,
    y: i32,

    pub fn add(a: Vec2, b: Vec2) Vec2 {
        return Vec2{
            .x = a.x+b.x,
            .y = a.y+b.y
        };
    }

    pub fn sub(a: Vec2, b: Vec2) Vec2 {
        return Vec2{
            .x = a.x-b.x,
            .y = a.y-b.y
        };
    }

    pub fn div(a: Vec2, b: Vec2) Vec2 {
        return Vec2{
            .x = a.x/b.x,
            .y = a.y/b.y
        };
    }

    pub fn mul(a: Vec2, b: Vec2) Vec2 {
        return Vec2{
            .x = a.x*b.x,
            .y = a.y*b.y
        };
    }

    pub fn addI(a: i32, b: Vec2) Vec2 {
        return Vec2{
            .x = a+b.x,
            .y = a+b.y
        };
    }

    pub fn subI(a: i32, b: Vec2) Vec2 {
        return Vec2{
            .x = a-b.x,
            .y = a-b.y
        };
    }

    pub fn divI(a: i32, b: Vec2) Vec2 {
        return Vec2{
            .x = a/b.x,
            .y = a/b.y
        };
    }

    pub fn mulI(a: i32, b: Vec2) Vec2 {
        return Vec2{
            .x = a*b.x,
            .y = a*b.y
        };
    }

    pub fn addS(a: *Vec2, b: Vec2) Vec2 {
        a.x += b.x;
        a.y += b.y;
    }
    
    pub fn subS(a: Vec2, b: Vec2) Vec2 {
        a.x -= b.x;
        a.y -= b.y;
    }

    pub fn divS(a: Vec2, b: Vec2) Vec2 {
        a.x /= b.x;
        a.y /= b.y;
    }

    pub fn mulS(a: Vec2, b: Vec2) Vec2 {
        a.x *= b.x;
        a.y *= b.y;
    }
};