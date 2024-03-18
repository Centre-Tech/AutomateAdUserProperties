<#
.SYNOPSIS
    Retrieves Active Directory user information and exports it to a CSV file.

.DESCRIPTION
    The Get-AdUsers function retrieves all Active Directory users and their properties, and exports the information to a CSV file.
    The function requires the Active Directory module to be loaded.

.PARAMETER Path
    The path where the CSV file will be saved.

.PARAMETER FileName
    The name of the CSV file.

.EXAMPLE
    Get-AdUsers -Path "C:\Users\testuser\Documents" -FileName "ADUsers"

    This example retrieves all Active Directory users and exports their information to a CSV file named "ADUsers.csv" in the "C:\Users\NKranz\Documents" directory.

.OUTPUTS
    System.String
    The full file path of the exported CSV file.

#>

function Get-AdUsers {
    param (
        [string]$Path,
        [string]$FileName
    )

    # Import the Active Directory module if not already loaded
    if (!(Get-Module -Name ActiveDirectory)) {
        Import-Module ActiveDirectory
    }

    # Get all AD users
    $users = Get-ADUser -Filter * -Properties *

    # Create an array to hold the user objects
    $userObjects = @()

    foreach ($user in $users) {
        # Create a new PSObject for each user
        $userObject = New-Object PSObject

        # Add all properties to the PSObject
        foreach ($property in $user.PSObject.Properties) {
            $userObject | Add-Member -NotePropertyName $property.Name -NotePropertyValue $property.Value
        }

        # Add the user object to the array
        $userObjects += $userObject
    }

    # Construct the full file path

    $fullPath = $("{0}{1}.csv"-f $Path, $FileName)
    #$fullPath = Join-Path -Path $Path -ChildPath "$FileName.csv"

    # Output the array of user objects to the specified file
    $userObjects | Export-Csv -Path $fullPath -NoTypeInformation -Confirm:$false

    return $fullPath
}

# Export the function so it can be used outside the module
Export-ModuleMember -Function *