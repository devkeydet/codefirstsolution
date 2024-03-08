Write-Host "Minifying web resources..."

$webResourceSrc = "webresource-src"
$webResourceSrcHolding = "obj\release\webresource-src"

if (!(Test-Path -Path $webResourceSrcHolding)) {
    New-Item -ItemType directory -Path $webResourceSrcHolding
}

Copy-Item -Path "$webResourceSrc\*" -Destination $webResourceSrcHolding -Force
$files = Get-ChildItem -Path $webResourceSrc -Filter *.js

foreach ($file in $files) {
    uglifyjs $file.FullName -o $file.FullName
}