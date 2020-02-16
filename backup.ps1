$sources = 
    "C:\Shahriar",
    "C:\Users\ctyar\Desktop",
    "C:\Users\ctyar\Downloads",
    "C:\Users\ctyar\.gitconfig"
    "C:\Users\ctyar\.ssh\config",
    "C:\Users\ctyar\AppData\Roaming\qBittorrent",
    "C:\Users\ctyar\AppData\Local\qBittorrent",
    "C:\Users\ctyar\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

$destination = Read-Host -Prompt "Enter destination path"
if ([string]::IsNullOrEmpty($destination))
{
    # Just for testing purposes
    $destination = "C:\Shahriar\backup"
}

Foreach ($source in $sources)
{
    Write-Host "Copying" $source
    Copy-Item -Path $source -Recurse -Destination $destination -Container
}