Write-Host "Cleaning up web resources minification..."

Remove-Item -Path webresource-src -Recurse
Rename-Item -Path webresource-src-holding -NewName webresource-src