const std = @import("std");
const module = @import("core_pretty");

test "core/pretty exposes its module name" {
    try std.testing.expectEqualStrings("core/pretty", module.moduleName());
}
