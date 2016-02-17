Function Get-TestAssemblies {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),
        
        [ValidateNotNullOrEmpty()]
        [string]
        $TestsDirectory = $(Get-TestsDirectory $SolutionDirectory),
                
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration = "Release"
    )
    Get-ChildItem -LiteralPath $TestsDirectory | ForEach-Object { Get-TestAssembly -ProjectDirectory $_.FullName -Configuration $Configuration }
}