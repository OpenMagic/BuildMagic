Function Get-TestAssemblies {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $TestsDirectory = $(Get-TestsDirectory),
                
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration = "Release"
    )
    Get-ChildItem -LiteralPath $TestsDirectory | ForEach-Object { Get-TestAssembly -ProjectDirectory $_.FullName -Configuration $Configuration }
}

# todo: Uncomment following lines to debug this function
# Set-Location $PSScriptRoot\..\..\..\
# . $PSScriptRoot\Get-SolutionDirectory
# . $PSScriptRoot\Get-ProjectName
# . $PSScriptRoot\Get-ProjectPath
# . $PSScriptRoot\Get-TestAssembly
# . $PSScriptRoot\Get-TestsDirectory
# Get-TestAssemblies