$ErrorActionPreference = "Stop"

$repo_root = Split-Path -Parent $PSScriptRoot
$dev_env = Join-Path $PSScriptRoot "dev-env.ps1"

Push-Location $repo_root
try {
    & $dev_env zig fmt .
    exit $LASTEXITCODE
} finally {
    Pop-Location
}
