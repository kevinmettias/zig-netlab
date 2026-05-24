$ErrorActionPreference = "Stop"

$repo_root = Split-Path -Parent $PSScriptRoot
$dev_env = Join-Path $PSScriptRoot "dev-env.ps1"

Push-Location $repo_root
try {
    & $dev_env zig fmt --check .
    if ($LASTEXITCODE -ne 0) { throw "zig fmt failed" }

    & $dev_env zig build
    if ($LASTEXITCODE -ne 0) { throw "zig build failed" }

    & $dev_env zig build test
    if ($LASTEXITCODE -ne 0) { throw "zig build test failed" }
} finally {
    Pop-Location
}
