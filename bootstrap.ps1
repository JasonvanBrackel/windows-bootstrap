Set-ExecutionPolicy Bypass
choco install webpi --confirm
refreshenv
choco install rsat --confirm
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
#choco install MsSqlServer2014Express --confirm
#refreshenv
choco install MsSqlServerManagementStudio2014Express --confirm
refreshenv
choco install sql2014-powershell --confirm
refreshenv

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
$srv.Alter()


Import-Module Dism
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
Enable-WindowsOptionalFeature -Online -FeatureName IIS-URLAuthorization
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IPSecurity
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
Enable-WindowsOptionalFeature -Online -FeatureName WAS-WindowsActivationService
Enable-WindowsOptionalFeature -Online -FeatureName WAS-ProcessModel
Enable-WindowsOptionalFeature -Online -FeatureName WAS-NetFxEnvironment
Enable-WindowsOptionalFeature -Online -FeatureName WAS-ConfigurationAPI
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HostableWebCore
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-NonHTTP-Activation 
Enable-WindowsOptionalFeature -Online -FeatureName WCF-Services45
Enable-WindowsOptionalFeature -Online -FeatureName WCF-HTTP-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-TCP-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-Pipe-Activation45
Enable-WindowsOptionalFeature -Online -FeatureName WCF-MSMQ-Activation45 -All
Enable-WindowsOptionalFeature -Online -FeatureName WCF-TCP-PortSharing45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CertProvider
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DigestAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ClientCertificateMappingAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IISCertificateMappingAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ODBCLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebDAV
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All     
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CGI -All
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CustomLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WMICompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacyScripts
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacySnapIn
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPSvc
Enable-WindowsOptionalFeature -Online -FeatureName IIS-FTPExtensibility

Invoke-WebRequest "https://github.com/azure/iisnode/releases/download/v0.2.21/iisnode-full-v0.2.21-x64.msi" -OutFile "$env:Temp\iisnode-full-v0.2.21-x64.msi"
msiexec /i "$env:Temp\iisnode-full-v0.2.21-x64.msi" /qn 
Remove-Item "$env:Temp\iisnode-full-v0.2.21-x64.msi" -Force -ErrorAction SilentlyContinue

webpicmd /install /accepteula /products:"WebFarmFramework,ExternalCache,UrlRewrite2,ARRv3_0"