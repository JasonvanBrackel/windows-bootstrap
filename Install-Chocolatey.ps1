
Set-ExecutionPolicy Bypass
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))