Write-Host "Resetting web resources minification..."
$webResourceSrcHolding = "obj\release\webresource-src"
$webResourceSrc = "webresource-src"
Remove-Item -Path $webResourceSrc -Recurse
New-Item -ItemType directory -Path $webResourceSrc
Copy-Item -Path "$webResourceSrcHolding\*" -Destination $webResourceSrc -Force