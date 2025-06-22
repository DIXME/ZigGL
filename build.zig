const std = @import("std");

pub fn link(module: *std.Build.Module, b: *std.Build) void {
    module.addIncludePath(b.path("include"));
    module.addObjectFile(b.path("bin/glfw3.dll"));
    module.addCSourceFile(.{
        .file = b.path("src/c/glad.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
    module.addCSourceFile(.{
        .file = b.path("src/c/Window.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
}

pub fn linke(module: *std.Build.Step.Compile, b: *std.Build) void {
    module.addIncludePath(b.path("include"));
    module.linkSystemLibrary("opengl32");
    module.addObjectFile(b.path("bin/glfw3.dll"));
    module.addCSourceFile(.{
        .file = b.path("src/c/glad.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
    module.addCSourceFile(.{
        .file = b.path("src/c/Window.c"),
        .flags = &[_][]const u8{"-Ilib"},
    });
    module.linkLibC();
}

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_source_file = b.path("src/main.zig"),
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    linke(exe, b);

    const window = b.createModule(.{
        .root_source_file = b.path("src/lib/Window.zig"),
    });
    const math = b.createModule(.{
        .root_source_file = b.path("src/lib/Math.zig"),
    });
    const vectors = b.createModule(.{
        .root_source_file = b.path("src/lib/Vectors.zig"),
    });
    const ccom = b.createModule(.{
        .root_source_file = b.path("src/lib/Cc.zig"),
    });

    link(window, b);
    link(math, b);
    link(vectors, b);
    link(ccom, b);

    exe.root_module.addImport("window", window);
    exe.root_module.addImport("math", math);
    exe.root_module.addImport("vectors", vectors);
    exe.root_module.addImport("ccom", ccom);

    // add dependices to modules as such
    window.addImport("ccom", ccom);

    b.installArtifact(exe);
}
