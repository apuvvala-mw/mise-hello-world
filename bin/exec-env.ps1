param (
[string]$installDir,
[string]$version
)

$env:PATH = "$installDir;$env:PATH"
