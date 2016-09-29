param(
    [string] $docfxExeUrl
)
$ErrorActionPreference = 'Stop'


$scriptPath = $MyInvocation.MyCommand.Path
$scriptHome = Split-Path $scriptPath
$api_ref = Join-Path $scriptHome "api_ref"
$tempFolder = "src"
md -Force $tempFolder

Push-Location $scriptHome
Push-Location $tempFolder

if (Test-Path EntityFramework)
{
    Push-Location EntityFramework
    & git pull
    Pop-Location
}
else
{
    & git clone https://github.com/aspnet/EntityFramework.git -q
}

$docfxZip = "docfx.zip"
$docfx = "docfx"

# download docfx from github.com
Invoke-WebRequest $docfxExeUrl -OutFile $docfxZip

# unzip docfx.zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $docfxZip $docfx

# run docfx metadata to generate YAML metadata
& .\$docfx\docfx.exe metadata $api_ref\docfx.json
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

# update to remote repo

Pop-Location
& git add .
& git commit -m "CI Updates"
& git push -u origin master
Pop-Location
