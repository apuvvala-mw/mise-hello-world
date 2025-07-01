param(
[string]$installDir,
[string]$version,
[string]$action
)

function List-AvailableVersions {
"1.0.0"
"2.0.0"
"3.0.0"
}

function Install-Version {
param (
[string]$installDir,
[string]$version
)

$target = Join-Path $installDir "mise-hello-world.ps1"

$content = @"
Write-Output 'Hello from mise-hello-world v$version'
"@

Set-Content -Path $target -Value $content -Encoding UTF8
chmod +x $target
}

switch ($action) {
    "--list-available" {
        List-AvailableVersions
        exit 0
        }
    "--install" {
        Install-Version -installDir $installDir -version $version
        exit 0
        }
    default {
    Write-Error "Unknown action: $action"
    exit 1
    }
    }
