Import-Module sqlps
$instanceName = "$env:Computername\SQLExpress"
$loginName = "apprendadbadmin"
$dbUserName = "apprendadbadmin"
$password = "P@ssword1"
$databasenames = "master"
$roleName = "db_owner"
#TODO adjust this to min viable
$adminRoles = @("bulkadmin", "diskadmin", "processadmin", "securityadmin", "setupadmin", "sysadmin")

$server = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $instanceName

# drop login if it exists
if ($server.Logins.Contains($loginName))  
{   
    Write-Host("Deleting the existing login $loginName.")
       $server.Logins[$loginName].Drop() 
}

$login = New-Object `
-TypeName Microsoft.SqlServer.Management.Smo.Login `
-ArgumentList $server, $loginName
$login.LoginType = [Microsoft.SqlServer.Management.Smo.LoginType]::SqlLogin
$login.PasswordExpirationEnabled = $false
$login.Create($password)
Write-Host("Login $loginName created successfully.")

foreach($databaseToMap in $databasenames)  
{
    $database = $server.Databases[$databaseToMap]
    if ($database.Users[$dbUserName])
    {
        Write-Host("Dropping user $dbUserName on $database.")
        $database.Users[$dbUserName].Drop()
    }

    $dbUser = New-Object `
    -TypeName Microsoft.SqlServer.Management.Smo.User `
    -ArgumentList $database, $dbUserName
    $dbUser.Login = $loginName
    $dbUser.Create()
    Write-Host("User $dbUser created successfully.")

    #assign database role for a new user
    $dbrole = $database.Roles[$roleName]
    $dbrole.AddMember($dbUserName)
    $dbrole.Alter()
    Write-Host("User $dbUser successfully added to $roleName role.")
}

foreach($serverRoleName in $adminRoles) {
    "Getting Role $serverRoleName"
    $serverRole = $server.Roles[$serverRoleName]
    $serverRole.AddMember($dbUserName)
    $serverRole.Alter()
    Write-Host "User $dbUser added to server role $serverRoleName."
}
