[CmdletBinding()]
param()
process {
    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop" 

    function Set-PolicyObjectRights(
        [string]$SID,
        [string[]]$Rights
    ) 
    {
        foreach($right in $Rights) {
            secedit /export /cfg tempexport.inf 
            $curSIDs = Select-String .\tempexport.inf -Pattern $right 
            $Sids = $curSIDs.line 
            $sidstring = ""
            
        
            if(!$Sids.Contains($SID)){
                $sidstring += ",*$SID"
            }

            if($sidstring) {
                $newSids = $sids + $sidstring
                $tempinf = Get-Content tempexport.inf
                $tempinf = $tempinf.Replace($Sids,$newSids)
                Add-Content -Path tempimport.inf -Value $tempinf 
            }

            secedit /import /db secedit.sdb /cfg ".\tempimport.inf" 
            secedit /configure /db secedit.sdb 
            
            gpupdate /force      
    
            del ".\tempimport.inf" -force -ErrorAction SilentlyContinue
            del ".\secedit.sdb" -force -ErrorAction SilentlyContinue
            del ".\tempexport.inf" -force
        }

        
    }
    
    
    $adminUser = New-LocalUser -Name "ApprendaAdmin" -Password (ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) -AccountNeverExpires -FullName "Apprenda Admin"

    $adminRights = @("SeServiceLogonRight", "SeInteractiveLogonRight")

    Set-PolicyObjectRights $adminUser.SID $adminRights

    Add-LocalGroupMember -Group Administrators  -Member "ApprendaAdmin"
}