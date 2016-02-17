Function Install-NuGetPackages {    
    Write-Host "Installing NuGet packages..." -ForegroundColor Yellow

    Install-NuGet
    
    $solutionPath = Get-SolutionPath
    $nuGetPath = Get-NuGetPath
    $packagesDirectory = Get-PackagesDirectory
    
    &$nuGetPath restore $solutionPath -PackagesDirectory $packagesDirectory
    
    If ($LASTEXITCODE -ne 0)
    {
        throw "Error '$LASTEXITCODE' while restoring NuGet packages."
    }
    
    Write-Host "Successfully installed NuGet packages." -ForegroundColor Green
}