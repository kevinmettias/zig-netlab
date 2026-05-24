const std = @import("std");
const module = @import("core_frame");

test "core/frame exposes its module name" {
    try std.testing.expectEqualStrings("core/frame", module.moduleName());
}
