Function Invoke-MSBuild {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Target,
        
        [ValidateNotNullOrEmpty()]
        [string]
        $StartingMessage = "Running MSBuild...",
        
        [ValidateNotNullOrEmpty()]
        [string]
        $ErrorMessage = "Error while building solution '{SolutionFile}'.",
        
        [ValidateNotNullOrEmpty()]
        [string]
        $SuccessfulMessage = "Successfully built solution '{SolutionFile}'.",        

        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration = "Release",
        
        [ValidateNotNullOrEmpty()]
        [string]
        $Verbosity = "minimal"
    )
    Write-Host $StartingMessage -ForegroundColor Yellow

    $solutionPath = Get-SolutionPath $SolutionDirectory
    $solutionFile = [System.IO.Path]::GetFileNameWithoutExtension($solutionPath)
    $cmd = { msbuild.exe $solutionPath /target:$Target /property:Configuration=$Configuration /verbosity:$Verbosity /nologo }
    $errorMessage = $ErrorMessage.Replace("{SolutionFile}", $solutionFile)

    Set-MSBuildEnvironment
    Exec $cmd $errorMessage
    
    Write-Host $SuccessfulMessage.Replace("{SolutionFile}", $solutionFile) -ForegroundColor Green    
}
