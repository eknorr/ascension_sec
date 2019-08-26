<## 
	.DESCRIPTION
		This PowerShell Code will harden Windows boxes
	.NOTES
		File Name		: WinSec-dtl
		Author		    : 2d
		Prerequisite	: PowerShell V3 or higher
		Copyright 2019	: Ascension.sec
##>
#list of all the hotfixes from https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
$hotfixes = "KB3205409", "KB3210720", "KB3210721", "KB3212646", "KB3213986", "KB4012212", "KB4012213", "KB4012214", "KB4012215", "KB4012216", "KB4012217", "KB4012218", "KB4012220", "KB4012598", "KB4012606", "KB4013198", "KB4013389", "KB4013429", "KB4015217", "KB4015438", "KB4015546", "KB4015547", "KB4015548", "KB4015549", "KB4015550", "KB4015551", "KB4015552", "KB4015553", "KB4015554", "KB4016635", "KB4019213", "KB4019214", "KB4019215", "KB4019216", "KB4019263", "KB4019264", "KB4019472", "KB4015221", "KB4019474", "KB4015219", "KB4019473"

#checks the computer it's run on if any of the listed hotfixes are present
$hotfix = Get-HotFix -ComputerName $env:computername | Where-Object {$hotfixes -contains $_.HotfixID} | Select-Object -property "HotFixID"

#confirms whether hotfix is found or not
if (Get-HotFix | Where-Object {$hotfixes -contains $_.HotfixID})
{"Found HotFix: " + $hotfix.HotFixID} 
else 
{Write-Warning "Didn't Find HotFix"}


Get-Hotfix -id KB4013429,KB4019472,KB4015217,KB4015438,KB4016635 ##patch for smb/eterblue
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol ##No run smbv1

Disable-PSRemoting -Force ##disables remote powerShell access

Stop-Service WinRM ##disables WinRM service

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
Set-MpPreference -EnableControlledFolderAccess Enabled ## makes your folders protected from ransomware 

Set-ExecutionPolicy AllSigned
##Sets a more secure execution policy

<##
	.After 
		After Script runs do the following: 
			-Open ports needed to get out 
		
##>