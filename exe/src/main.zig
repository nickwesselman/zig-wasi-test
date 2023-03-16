const std = @import("std");

pub fn main() void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    stdout.print("{{ \"hello\": true }}", .{}) catch |err| {
        std.debug.print("Error writing: {!}", .{err});
        return;
    };
    bw.flush() catch |err| {
        std.debug.print("Error flushing: {!}", .{err});
        return;
    };
}
