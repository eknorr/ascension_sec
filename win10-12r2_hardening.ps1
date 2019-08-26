<## 
	.DESCRIPTION
		This PowerShell Code will harden Windows boxes
	.NOTES
		File Name		: WinSec-dtl
		Author		    : 2d
		Prerequisite	: PowerShell V3 or higher
		Copyright 2019	: Ascension.sec
##>
Get-Hotfix -id KB4012216,KB4015550,KB4019215 ##patch for smb/eterblue
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol ##No run smbv1

Disable-PSRemoting -Force ##disables remote powerShell access

Stop-Service WinRM -PassThruSet-Service WinRM -StartupType Disabled -PassThru ##disables WinRM service

Remove-Item -Path WSMan:\localhost\listener\listener* -Recurse  ##removes all listeners

## Firewall Rules
Set-NetFirewallProfile -Name "domain" -LogMaxSizeKilobytes 10240 -LogAllowed "true" -LogBlocked "true" ##enables logs
Set-NetFirewallProfile -Name "Private" -LogMaxSizeKilobytes 10240 -LogAllowed "true" -LogBlocked "true" ##enables logs
Set-NetFirewallProfile -Name "Public" -LogMaxSizeKilobytes 10240 -LogAllowed "true" -LogBlocked "true" ##enables logs
Disable-NetFirewallRule -All
$nv4a = @{
	DisplayName = "Disable inbound ICMPv4"
	Direction = "Inbound"
	Protocol = "ICMPv4"
	ICMPType = 0;
	Action = "Block"
}
$nv4b = @{
	DisplayName = "Disable inbound ICMPv4"
	Direction = "Inbound"
	Protocol = "ICMPv4"
	ICMPType = 8;
	Action = "Block"
}
$nv6a = @{
	DisplayName = "Disable inbound ICMPv6"
	Direction = "Inbound"
	Protocol = "ICMPv6"
	ICMPType = 128;
	Action = "Block"
}
$nv6b = @{
	DisplayName = "Disable inbound ICMPv6"
	Direction = "Inbound"
	Protocol = "ICMPv6"
	ICMPType = 129;
	Action = "Block"
}

New-NetFirewallRule -Displayname "Block-Allin" -Action "Block" -Enabled "True" -Direction "Inbound"
New-NetFirewallRule @nv4a
New-NetFirewallRule @nv4b
New-NetFirewallRule @nv6a 
New-NetFirewallRule @nv6b
New-NetFirewallRule -DisplayName 'Disable Remote-In' -Enabled "False" -PassThru | Select -Property "DisplayName", "Profile", "Enabled"

Get-Command -Module Defender 
Update-MpSignature
Get-MpThreatCatalog
Get-MpThreat 
Remove-MpPreference 
Remove-MpThreat
GET-MPComputerStatus
Start-MpScan -ScanType FullScan 
Set-MpPreference -EnableControlledFolderAccess Enabled ## makes your folders more protected from ransomware 

Set-ExecutionPolicy AllSigned
##Sets a more secure execution policy

<##
	.After 
		After Script runs do the following: 
			-Open ports needed to get out 
		
##>