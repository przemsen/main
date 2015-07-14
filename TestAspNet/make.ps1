mkdir -force .\WebSite\bin
Remove-Item .\WebSite\bin\*
Get-ChildItem .\packages -recurse -filter "*.dll" | %{Join-Path -Path $_.Directory -ChildPath $_.Name } | Copy-Item -Destination .\WebSite\bin
# out-string