const std = @import("std");
const module = @import("tap");

test "tap exposes its module name" {
    try std.testing.expectEqualStrings("tap", module.moduleName());
}
