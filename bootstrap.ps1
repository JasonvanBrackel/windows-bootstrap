Set-ExecutionPolicy Bypass
choco install webpi --confirm
refreshenv
choco install pester --confirm
refreshenv
choco install pscx --confirm
refreshenv
choco install visualstudiocode --confirm
refreshenv
choco install putty.install --confirm
refreshenv
choco install docker-for-windows --confirm
refreshenv
choco install docker-compose --confirm
refreshenv
choco install golang --confirm
refreshenv
choco install notepadplusplus.install --confirm
refreshenv
choco install git.install --confirm
refreshenv
choco install hg --confirm
refreshenv
choco install googlechrome --confirm
refreshenv
choco install firefox --confirm
refreshenv
choco install winrar --confirm
refreshenv
choco install 7zip.install --confirm
refreshenv
choco install vlc --confirm
refreshenv
choco install jdk8 --confirm
refreshenv
choco install sysinternals --confirm
refreshenv
choco install procexp --confirm
refreshenv
choco install dropbox --confirm
refreshenv
choco install vim --confirm
refreshenv
choco install calibre --confirm
refreshenv
choco install fiddler4 --confirm
refreshenv
choco install sourcetree --confirm
refreshenv
choco install vagrant --confirm
refreshenv
choco install procmon --confirm
refreshenv
choco install openssh --confirm
refreshenv
choco install winmerge --confirm
refreshenv
choco install nmap --confirm
refreshenv
choco install f.lux --confirm
refreshenv
choco install spotify --confirm
refreshenv
choco install nodejs --confirm
refreshenv
choco install npm --confirm
refreshenv
choco install pip --confirm
refreshenv
choco install visualstudio2017enterprise --confirm #uncomment for all  --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
refreshenv
choco install resharper-platform --confirm
refreshenv
choco install sql-server-management-studio --confirm
refreshenv
choco install MsSqlServerManagementStudio2014Express --confirm
refreshenv
choco install sql2014-powershell --confirm
refreshenv

#TODO Reboot here

Get-Service SQLBrowser | Start-Service

Write-Host "Enabling remote connections "
Import-Module sqlps
$smo = 'Microsoft.SqlServer.Management.Smo.'  
$wmi = new-object ($smo + 'Wmi.ManagedComputer').  

# List the object properties, including the instance names.  
$Wmi  

# Enable the TCP protocol on the default instance.  
$uri = "ManagedComputer[@Name='$($wmi.Name)']/ ServerInstance[@Name='SQLEXPRESS']/ServerProtocol[@Name='Tcp']"  
$Tcp = $wmi.GetSmoObject($uri)  
$Tcp.IsEnabled = $true  
$Tcp.Alter()  
$Tcp  

# Enable the named pipes protocol for the default instance.  
$uri = "ManagedComputer[@Name='$($wmi.Name)']/ ServerInstance[@Name='SQLEXPRESS']/ServerProtocol[@Name='Np']"  
$Np = $wmi.GetSmoObject($uri)  
$Np.IsEnabled = $true  
$Np.Alter()  
$Np

# Setup Mode
# Connect to the instance using SMO
$s = new-object ('Microsoft.SqlServer.Management.Smo.Server') "$($wmi.Name)\SQLEXPRESS"
[string]$nm = $s.Name
[string]$mode = $s.Settings.LoginMode

write-output "Instance Name: $nm"
write-output "Login Mode: $mode"

#Change to Mixed Mode
$s.Settings.LoginMode = [Microsoft.SqlServer.Management.SMO.ServerLoginMode]::Mixed

# Make the changes
$s.Alter()


Import-Module Dism
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45 -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-URLAuthorization -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IPSecurity -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase -All
Enable-WindowsOptionalFeature -Online -FeatureName WAS-WindowsActivationService -All
Enable-WindowsOptionalFeature -Online -FeatureName WAS-ProcessModel -All
Enable-WindowsOptionalFeature -Online -FeatureName WAS-NetFxEnvironment -All
Enable-WindowsOptionalFeature -Online -FeatureName WAS-ConfigurationAPI -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HostableWebCore -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-NonHTTP-Activation  -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-Services45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-TCP-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-Pipe-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-MSMQ-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-TCP-PortSharing45 -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CertProvider -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DigestAuthentication -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ClientCertificateMappingAuthentication -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IISCertificateMappingAuthentication -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ODBCLogging -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebDAV -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All     
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CGI -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CustomLogging -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WMICompatibility -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacyScripts -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacySnapIn -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPServer -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPSvc -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPExtensibility -All

Invoke-WebRequest "https://github.com/azure/iisnode/releases/download/v0.2.21/iisnode-full-v0.2.21-x64.msi" -OutFile "$env:Temp\iisnode-full-v0.2.21-x64.msi"
msiexec /i "$env:Temp\iisnode-full-v0.2.21-x64.msi" /qn 
Remove-Item "$env:Temp\iisnode-full-v0.2.21-x64.msi" -Force -ErrorAction SilentlyContinue

webpicmd /install /accepteula /products:"ExternalCache,UrlRewrite2,ARRv3_0"

#TODO Reboot here

