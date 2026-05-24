const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const core_frame_module = b.createModule(.{
        .root_source_file = b.path("core/frame/frame.zig"),
        .target = target,
        .optimize = optimize,
    });
    const core_io_module = b.createModule(.{
        .root_source_file = b.path("core/io/io.zig"),
        .target = target,
        .optimize = optimize,
    });
    const core_pcap_module = b.createModule(.{
        .root_source_file = b.path("core/pcap/pcap.zig"),
        .target = target,
        .optimize = optimize,
    });
    const core_pool_module = b.createModule(.{
        .root_source_file = b.path("core/pool/pool.zig"),
        .target = target,
        .optimize = optimize,
    });
    const core_pretty_module = b.createModule(.{
        .root_source_file = b.path("core/pretty/pretty.zig"),
        .target = target,
        .optimize = optimize,
    });
    const tap_module = b.createModule(.{
        .root_source_file = b.path("tap/tap.zig"),
        .target = target,
        .optimize = optimize,
    });
    const tools_module = b.createModule(.{
        .root_source_file = b.path("tools/tools.zig"),
        .target = target,
        .optimize = optimize,
    });
    const router_exe_module = b.createModule(.{
        .root_source_file = b.path("router/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    router_exe_module.addImport("core_frame", core_frame_module);
    router_exe_module.addImport("core_io", core_io_module);
    router_exe_module.addImport("core_pcap", core_pcap_module);
    router_exe_module.addImport("core_pool", core_pool_module);
    router_exe_module.addImport("core_pretty", core_pretty_module);
    router_exe_module.addImport("tap", tap_module);
    router_exe_module.addImport("tools", tools_module);
    const router_exe = b.addExecutable(.{
        .name = "router",
        .root_module = router_exe_module,
    });
    b.installArtifact(router_exe);
    const sniffer_exe_module = b.createModule(.{
        .root_source_file = b.path("sniffer/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    sniffer_exe_module.addImport("core_frame", core_frame_module);
    sniffer_exe_module.addImport("core_io", core_io_module);
    sniffer_exe_module.addImport("core_pcap", core_pcap_module);
    sniffer_exe_module.addImport("core_pool", core_pool_module);
    sniffer_exe_module.addImport("core_pretty", core_pretty_module);
    sniffer_exe_module.addImport("tap", tap_module);
    sniffer_exe_module.addImport("tools", tools_module);
    const sniffer_exe = b.addExecutable(.{
        .name = "sniffer",
        .root_module = sniffer_exe_module,
    });
    b.installArtifact(sniffer_exe);
    const switch_exe_module = b.createModule(.{
        .root_source_file = b.path("switch/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    switch_exe_module.addImport("core_frame", core_frame_module);
    switch_exe_module.addImport("core_io", core_io_module);
    switch_exe_module.addImport("core_pcap", core_pcap_module);
    switch_exe_module.addImport("core_pool", core_pool_module);
    switch_exe_module.addImport("core_pretty", core_pretty_module);
    switch_exe_module.addImport("tap", tap_module);
    switch_exe_module.addImport("tools", tools_module);
    const switch_exe = b.addExecutable(.{
        .name = "switch",
        .root_module = switch_exe_module,
    });
    b.installArtifact(switch_exe);
    const test_step = b.step("test", "Run unit tests");
    const core_frame_test_module = b.createModule(.{
        .root_source_file = b.path("core/frame/frame_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    core_frame_test_module.addImport("core_frame", core_frame_module);
    const core_frame_tests = b.addTest(.{
        .root_module = core_frame_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(core_frame_tests).step);
    const core_io_test_module = b.createModule(.{
        .root_source_file = b.path("core/io/io_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    core_io_test_module.addImport("core_io", core_io_module);
    const core_io_tests = b.addTest(.{
        .root_module = core_io_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(core_io_tests).step);
    const core_pcap_test_module = b.createModule(.{
        .root_source_file = b.path("core/pcap/pcap_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    core_pcap_test_module.addImport("core_pcap", core_pcap_module);
    const core_pcap_tests = b.addTest(.{
        .root_module = core_pcap_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(core_pcap_tests).step);
    const core_pool_test_module = b.createModule(.{
        .root_source_file = b.path("core/pool/pool_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    core_pool_test_module.addImport("core_pool", core_pool_module);
    const core_pool_tests = b.addTest(.{
        .root_module = core_pool_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(core_pool_tests).step);
    const core_pretty_test_module = b.createModule(.{
        .root_source_file = b.path("core/pretty/pretty_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    core_pretty_test_module.addImport("core_pretty", core_pretty_module);
    const core_pretty_tests = b.addTest(.{
        .root_module = core_pretty_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(core_pretty_tests).step);
    const tap_test_module = b.createModule(.{
        .root_source_file = b.path("tap/tap_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    tap_test_module.addImport("tap", tap_module);
    const tap_tests = b.addTest(.{
        .root_module = tap_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(tap_tests).step);
    const tools_test_module = b.createModule(.{
        .root_source_file = b.path("tools/tools_test.zig"),
        .target = target,
        .optimize = optimize,
    });
    tools_test_module.addImport("tools", tools_module);
    const tools_tests = b.addTest(.{
        .root_module = tools_test_module,
    });
    test_step.dependOn(&b.addRunArtifact(tools_tests).step);
}
