param (
    [string]$installDir,
    [string]$version
)

$action = $args[0]  # First unnamed argument like "--list-available"

function List-AvailableVersions {
    Write-Output "1.0.0"
    Write-Output "2.0.0"
    Write-Output "3.0.0"
}

function Install-Version {
    New-Item -ItemType Directory -Force -Path $installDir | Out-Null
    $script = Join-Path $installDir "hello-world.ps1"
    Set-Content -Path $script -Value "Write-Output 'Hello from hello-world v$version'" -Encoding UTF8
}

switch ($action) {
    "--list-available" {
        List-AvailableVersions
        exit 0
    }
    "--install" {
        Install-Version
        exit 0
    }
    default {
        Write-Error "Unknown action: $action"
        exit 1
    }
}
