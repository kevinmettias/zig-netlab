const std = @import("std");
const module = @import("core_pool");

test "core/pool exposes its module name" {
    try std.testing.expectEqualStrings("core/pool", module.moduleName());
}
