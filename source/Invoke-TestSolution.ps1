Function Invoke-TestSolution {
    param(
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory $SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration = "Release",

        [ValidateNotNullOrEmpty()]
        [string[]]
        $TestAssemblies = $(Get-TestAssemblies -SolutionDirectory $SolutionDirectory -Configuration $Configuration),

        [ValidateNotNullOrEmpty()]
        [string]
        $XUnitPath = $(Get-XUnitPath -PackagesDirectory $PackagesDirectory)
    )    
    Write-Host "Running tests..." -ForegroundColor Yellow

    $assemblies = [System.String]::Join(" ", $TestAssemblies)
    $cmd = { &$XUnitPath $assemblies }
    $errorMessage = "Error while running tests."
    Exec $cmd $errorMessage 

    Write-Host "Successfully ran tests." -ForegroundColor Green
}