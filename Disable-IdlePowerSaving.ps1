#Disable the Idle Power Saving setting on Realtek USB GbE Family Controller network adapter 
Get-NetAdapter | Where InterfaceDescription -like "Realtek USB GbE Family Controller*" | % {  
	Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Idle Power Saving" -DisplayValue "Disabled"	  
}