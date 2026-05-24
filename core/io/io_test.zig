const std = @import("std");
const module = @import("core_io");

test "core/io exposes its module name" {
    try std.testing.expectEqualStrings("core/io", module.moduleName());
}
