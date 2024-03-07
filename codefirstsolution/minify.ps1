$webResourceSrc = "webresource-src"
$webResourceSrcHolding = "webresource-src-holding"
Copy-Item -Path $webResourceSrc -Destination $webResourceSrcHolding -Recurse
$files = Get-ChildItem -Path $webResourceSrc -Filter *.js

echo $files.Count

foreach ($file in $files) {
    echo $file.FullName
    uglifyjs $file.FullName -o ($file.FullName)
}