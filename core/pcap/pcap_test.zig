const std = @import("std");
const module = @import("core_pcap");

test "core/pcap exposes its module name" {
    try std.testing.expectEqualStrings("core/pcap", module.moduleName());
}
