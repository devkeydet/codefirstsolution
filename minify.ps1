Write-Host "Minifying web resources..."

$webResourceSrc = "webresource-src"
$webResourceSrcMinifyTemp = "obj\release\webresource-src"

if (!(Test-Path -Path $webResourceSrcMinifyTemp)) {
    New-Item -ItemType directory -Path $webResourceSrcMinifyTemp
} else {
    Get-ChildItem $webResourceSrcMinifyTemp | Remove-Item -Recurse -Force
}

Copy-Item -Path "$webResourceSrc\*" -Destination $webResourceSrcMinifyTemp -Force
$files = Get-ChildItem -Path $webResourceSrcMinifyTemp -Filter *.js

foreach ($file in $files) {
    uglifyjs $file.FullName -o $file.FullName
}