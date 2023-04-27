$interfaceAlias = (Get-NetAdapter | where InterfaceDescription -eq "Killer Wireless-n/a/ac 1535 Wireless Network Adapter")."Name"

$ip = (Get-NetIPConfiguration | where InterfaceAlias -eq $interfaceAlias).IPv4Address.IPAddress

Set-DNSClientServerAddress $interfaceAlias –ServerAddresses ($ip)

cd C:\Shahriar\Tools\DnsServerPortable\

Start-Process -Wait dotnet DnsServerApp.dll 

Set-DNSClientServerAddress $interfaceAlias -ResetServerAddresses