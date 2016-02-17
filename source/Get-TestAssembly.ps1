Function Get-TestAssembly {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectDirectory,
                
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration = "Release"
    )
    $projectName = Get-ProjectName -ProjectDirectory $ProjectDirectory
    $testAssembly = [System.IO.Path]::Combine($ProjectDirectory, "bin\$Configuration\$projectName.dll")
    
    if (-not (Test-Path $testAssembly)) {
        throw "Cannot find test assembly '$testAssembly'."
    }
    
    return $testAssembly
}