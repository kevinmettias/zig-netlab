pub const PcapInfo = struct {
    name: []const u8,
};

pub fn moduleName() []const u8 {
    return "core/pcap";
}
