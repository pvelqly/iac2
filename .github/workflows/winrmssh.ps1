winrm quickconfig -force;
Set-NetConnectionProfile -Name "Network" -NetworkCategory Private;
netsh advfirewall firewall add rule name=WinRM-HTTP dir=in localport=5985 protocol=TCP action=allow;
netsh advfirewall firewall add rule name=ssh dir=in localport=22 protocol=TCP action=allow;
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
mkdir C:\Qualys
