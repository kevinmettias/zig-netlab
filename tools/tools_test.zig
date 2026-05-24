const std = @import("std");
const module = @import("tools");

test "tools exposes its module name" {
    try std.testing.expectEqualStrings("tools", module.moduleName());
}
