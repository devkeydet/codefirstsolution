param (
    [string]$c
)

$webResourceSrc = "webresource-src"
$webResourceSrcTemp = "obj\$c\webresource-src"

Write-Host "Copying JavaScript web resources to $webResourceSrcTemp"

if (!(Test-Path -Path $webResourceSrcTemp)) {
    New-Item -ItemType directory -Path $webResourceSrcTemp
}
else {
    Get-ChildItem $webResourceSrcTemp | Remove-Item -Recurse -Force
}

Copy-Item -Path "$webResourceSrc\*" -Destination $webResourceSrcTemp -Force
$files = Get-ChildItem -Path $webResourceSrcTemp -Filter *.js

if ($c -eq "release") {
    Write-Host "Minfying JavaScript web resources in $webResourceSrcTemp"
    foreach ($file in $files) {
        uglifyjs $file.FullName -o $file.FullName
    }
}