function Install-psake {    
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory -SolutionDirectory $SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $NuGetPath = $(Get-NuGetPath -PackagesDirectory $PackagesDirectory)
    )
    Write-Host "Installing psake..." -ForegroundColor Yellow

    if (Test-Path "$PackagesDirectory\psake") {
        Write-Host "psake is already installed."
    } else {
        Install-NuGet
        
        &$NuGetPath install psake -OutputDirectory $PackagesDirectory -ExcludeVersion
        
        If ($LASTEXITCODE -ne 0)
        {
            throw "Error '$LASTEXITCODE' while install psake."
        }
    }
    Write-Host "Successfully installed psake." -ForegroundColor Green
}