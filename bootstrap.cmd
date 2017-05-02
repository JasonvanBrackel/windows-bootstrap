@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
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
choco install webpi --confirm
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
choco install visualstudio2017enterprise --confirm --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
refreshenv
choco install resharper-platform --confirm