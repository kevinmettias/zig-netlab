param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $Command
)

$ErrorActionPreference = "Stop"

$clang_bin = "C:\msys64\clang64\bin"
$usr_bin = "C:\msys64\usr\bin"
$env:Path = "$clang_bin;$usr_bin;$env:Path"

if ($Command.Count -eq 0) {
    zig version
    exit $LASTEXITCODE
}

$program = $Command[0]
$arguments = @()
if ($Command.Count -gt 1) {
    $arguments = $Command[1..($Command.Count - 1)]
}

& $program @arguments
exit $LASTEXITCODE
