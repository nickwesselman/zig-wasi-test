const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = .{ .cpu_arch = .wasm32, .os_tag = .wasi };
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("exe", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();
}
