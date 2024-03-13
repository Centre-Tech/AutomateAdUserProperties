param (
    [string]$Path,
    [string]$FileName
)

Try {
    # Import the custom module
    Import-Module module.psm1
}
catch {
    exit 1
}

# Call the function and specify the path and file name parameters
$adUsersPath = Get-AdUsers -Path $Path -FileName $FileName

return $adUsersPath
