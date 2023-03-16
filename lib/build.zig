const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = .{ .cpu_arch = .wasm32, .os_tag = .wasi };
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary("lib", "src/main.zig", .unversioned);
    lib.setBuildMode(mode);
    lib.setTarget(target);
    lib.install();
}
