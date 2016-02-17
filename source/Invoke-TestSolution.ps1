Function Invoke-TestSolution {
    param(
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration,

        [ValidateNotNullOrEmpty()]
        [string[]]
        $TestAssemblies = $(Get-TestAssemblies -Configuration $Configuration),

        [ValidateNotNullOrEmpty()]
        [string]
        $XUnitPath = $(Get-XUnitPath)
    )    
    Write-Host "Running tests..." -ForegroundColor Yellow

    $assemblies = [System.String]::Join(" ", $TestAssemblies)
    $cmd = { &$XUnitPath $assemblies }
    $errorMessage = "Error while running tests."
    Exec $cmd $errorMessage 

    Write-Host "Successfully ran tests." -ForegroundColor Green
}

# todo: Uncomment following lines to debug this function
# $ErrorActionPreference = "Stop"
# $WarningPreference = "SilentlyContinue"
# $VerbosePreference = "SilentlyContinue"
# 
# Set-Location $PSScriptRoot\..\..\..\
# . $PSScriptRoot\Get-PackagesDirectory
# . $PSScriptRoot\Get-ProjectName
# . $PSScriptRoot\Get-ProjectPath
# . $PSScriptRoot\Get-SolutionDirectory
# . $PSScriptRoot\Get-TestAssemblies
# . $PSScriptRoot\Get-TestAssembly
# . $PSScriptRoot\Get-TestsDirectory
# . $PSScriptRoot\Get-XUnitPath
# . $PSScriptRoot\psake\Exec
# 
# Invoke-TestSolution -Configuration Release