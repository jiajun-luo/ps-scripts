#Check installed programs (old)
Get-WmiObject -Class Win32_Product | Select-Object Name, Version, Vendor | Sort-Object Name

#Check installed programs (modern)
Get-Package | Select-Object Name, Version, ProviderName | Sort-Object Name

#Check BIOS version
Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion

#Check PC uptime
Get-CimInstance Win32_OperatingSystem | Select LastBootUpTime

#Check image date
Get-CimInstance Win32_OperatingSystem | select Version, InstallDate

#Check network properties for specific adapter
Get-NetAdapter -Name "Ethernet" | Get-NetAdapterAdvancedProperty
