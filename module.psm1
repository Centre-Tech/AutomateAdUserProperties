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
    $users = Get-ADUser -Filter * -Property *

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
    $fullPath = Join-Path -Path $Path -ChildPath "$FileName.csv"

    # Output the array of user objects to the specified file
    $userObjects | Export-Csv -Path $fullPath -NoTypeInformation

    return $fullPath
}




# Export the function so it can be used outside the module
Export-ModuleMember -Function *