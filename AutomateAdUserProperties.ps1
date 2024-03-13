param (
    [string]$Path,
    [string]$FileName
)

# Try {
#     # Import the custom module
#     Import-Module $("{0}{1}"-f $Path, "module.psm1") -Force
# }
# catch {
#     Write-Host "Error: $_"
# }

# [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls1
# [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
    
#     $ignoreCerts = @"
# public class SSLHandler
# {
#     public static System.Net.Security.RemoteCertificateValidationCallback GetSSLHandler()
#     {
#         return new System.Net.Security.RemoteCertificateValidationCallback((sender, certificate, chain, policyErrors) => { return true; });
#     }
# }
# "@

# Add-Type -TypeDefinition $ignoreCerts
# [System.Net.ServicePointManager]::ServerCertificateValidationCallback = [SSLHandler]::GetSSLHandler()

 Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Confirm:$false 

# Call the function and specify the path and file name parameters
$adUsersPath = Get-AdUsers -Path $Path -FileName $FileName

return $adUsersPath
