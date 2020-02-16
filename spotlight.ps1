Set-Location -Path C:\Shahriar\Projects\PowerCogs\Spotlight

New-Item -ItemType Directory -Force -Path .\images

$today = Get-Date -Format "MM/dd/yyyy"

$count = (Get-ChildItem -Path .\images | Where-Object { $_.CreationTime -ge $today }).Count

if ($count -ge 1)
{
    exit
}

Remove-Item .\images\* -Recurse

.\SpotlightDownloader.exe download --maxres --outdir images
.\SpotlightDownloader.exe wallpaper --from-dir images
.\SpotlightDownloader.exe lockscreen --from-dir images