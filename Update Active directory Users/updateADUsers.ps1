# Performs an update on all users within an OUs array
Import-Module ActiveDirectory
$ous = "ou1","ou2","otherOu"
ForEach($ou in $ous) {
    $users = Get-ADUser -SearchBase "ou=$ou,ou=ParentOu,dc=example,dc=com" -Filter *
    Write-Host $ou
    ForEach($user in $users)  
    {
        $firstname = $user | Select GivenName | % {$_.GivenName}
        $lastname = $user | Select Surname | % {$_.Surname}

        # Checks to create valid email string from french names
        if($firstname.contains("é")) {
            $firstname = $firstname.Replace("é","e")
        }
        if($firstname.contains("è")) {
            $firstname = $firstname.Replace("è","e")
        }
        if($lastname) {
            if($lastname.contains("é")) {
                $lastname = $lastname.replace("é","e")
            }
            if($lastname.contains("è")) {
                $lastname = $lastname.Replace("è","e")
            }
            if($lastname.contains(" ")) {
                $lastname = $lastname.replace(" ","")
            }
            if($lastname.contains("'")) {
                $lastname = $lastname.replace("'","")
            }
        }
        if(!$lastname) {
            "Not valid - $firstname" | Out-File \\share\not-valid.txt -Append
        } else {
            "$firstname.$lastname@example.com" | Out-File \\share\valid.txt -Append
            Set-ADUser -Identity $user.DistinguishedName -UserPrincipalName "$firstname.$lastname@example.com" -Clear msRTCSIP-DeploymentLocator
        }
    }
}