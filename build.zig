const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_source_file = b.path("src/main.zig"),
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    exe.addIncludePath(b.path("include"));
    exe.linkSystemLibrary("opengl32");
    exe.addObjectFile(b.path("bin/glfw3.dll"));
    exe.addCSourceFile(.{
        .file = b.path("src/c/glad.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
    exe.addCSourceFile(.{
        .file = b.path("src/c/Window.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
    exe.linkLibC();
    b.installArtifact(exe);
}
