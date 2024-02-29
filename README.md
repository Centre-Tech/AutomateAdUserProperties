# AutomateAdUserProperties

This project gathers all AD users and properties and outputs the information to .csv

## Usage

1. Open PowerShell and navigate to the project directory:

    ```powershell
    cd C:\AutomateAD
    ```

2. Run the main script:

    ```powershell
    .\run.ps1 -Path "C:\windows\temp\" -FileName "CompanyID_domain.local"
         output = C:\windows\temp\CompanyID_domain.local.csv
    ```