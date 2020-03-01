# wifi
$netAdapters = Get-NetAdapter
if (($netAdapters | where InterfaceDescription -eq "D-Link DUB-1312/1332 USB3.0 to Gigabit Ethernet Adapter" | measure).Count -gt 0)
{
    netsh wlan disconnect
}
elseif (($netAdapters | where InterfaceDescription -eq "Remote NDIS Compatible Device" | measure).Count -gt 0)
{
    netsh wlan disconnect
}
elseif (($netAdapters | where InterfaceDescription -eq "Killer Wireless-n/a/ac 1535 Wireless Network Adapter" | where status -eq 'up' | measure).Count -eq 0)
{
    netsh wlan connect ssid=gnet name=gnet
}

# Brightness
$monitor = Get-WmiObject -Namespace root\wmi -Class WmiMonitorBrightnessMethods
if ((Get-CimInstance win32_battery).batterystatus -eq 1)
{
    $monitor.wmisetbrightness(0, 0)
}
else
{
    $monitor.wmisetbrightness(0, 40)
}
