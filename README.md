# AutomateAdUserProperties

This project gathers all AD users and properties and outputs the information to .csv

## Usage

1. Open PowerShell and change to temp directory:

    ```powershell
    cd C:\Windows\Temp
    ```
2. Download local:

```powershell
# PSVersion5+
$scriptName = 'Get-ADUserProperties'
$moduleName = 'module'
$repoURL = 'https://raw.githubusercontent.com/Centre-Tech/AutomateAdUserProperties/master'
(Invoke-WebRequest -UseBasicParsing -Uri "$repoUrl/$scriptName.ps1").content | Out-File "$scriptName.ps1"; (Get-Content "$scriptName.ps1") | Set-Content "$scriptName.ps1"
(Invoke-WebRequest -UseBasicParsing -Uri "$repoUrl/$moduleName.psm1").content | Out-File "$moduleName.psm1"; (Get-Content "$moduleName.psm1") | Set-Content "$moduleName.psm1"
```

```powershell
# PSVersion5-
$scriptName = 'Get-ADUserProperties'
$moduleName = 'module'
$repoURL = 'https://raw.githubusercontent.com/Centre-Tech/AutomateAdUserProperties/master'
(New-Object System.Net.WebClient).DownloadFile("$repoUrl/$scriptName.ps1", "C:\Windows\Temp\$scriptName.ps1")
(New-Object System.Net.WebClient).DownloadFile("$repoUrl/$moduleName.psm1", "C:\Windows\Temp\$moduleName.psm1")
```

``` Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls1
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
    
    $ignoreCerts = @"
public class SSLHandler
{
    public static System.Net.Security.RemoteCertificateValidationCallback GetSSLHandler()
    {
        return new System.Net.Security.RemoteCertificateValidationCallback((sender, certificate, chain, policyErrors) => { return true; });
    }
}
"@

Add-Type -TypeDefinition $ignoreCerts
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = [SSLHandler]::GetSSLHandler()

set-executionpolicy -executionpolicy UnRestricted
```

3. Run the main script:

    ```powershell
    $output = .\run.ps1 -Path "C:\windows\temp\" -FileName "CompanyID_domain.local"
    notepad $output
    ```


