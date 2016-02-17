# Loads all PowerShell scripts in .\source folder.

Get-ChildItem -Path $PSScriptRoot\source -Filter *.ps1 -Recurse |
    ForEach-Object { 
        Write-Verbose "Loading library file '$($_.Name)'"
        . $_.FullName
    }