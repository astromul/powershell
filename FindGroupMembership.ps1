#Written by Rahul Mullick
# This script finds the group membership under a domain for a single user

$username = ""
$userfound = ""
$server = Read-Host "Enter the domain server name where your users reside"
$ReCoServer = Read-Host "Enter the domain server in which group membership resides (this may be different than the domain server where your users reside)" 

while($username -eq ""){
    $username = Read-Host "Enter Username"
    try {
        $userFound = Get-ADUser -ErrorAction SilentlyContinue $username -server $server
    } 
    catch{  
        Write-Host "$username not found!"
        $username = ""
    }
}

$ou = Get-ADPrincipalGroupMembership -Identity $username -server $server -ResourceContextServer $ReCoServer | select name | sort name

$ou
