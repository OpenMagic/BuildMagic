Function Install-NuGetPackages {    
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
    Write-Host "Installing NuGet packages..." -ForegroundColor Yellow

    Install-NuGet
    
    $solutionPath = Get-SolutionPath $SolutionDirectory
    
    &$NuGetPath restore $solutionPath -PackagesDirectory $PackagesDirectory
    
    If ($LASTEXITCODE -ne 0)
    {
        throw "Error '$LASTEXITCODE' while restoring NuGet packages."
    }
    
    Write-Host "Successfully installed NuGet packages." -ForegroundColor Green
}