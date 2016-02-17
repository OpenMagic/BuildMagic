Function Invoke-MSBuild {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Target,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Verbosity,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $StartingMessage,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ErrorMessage,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $SuccessfulMessage        
    )
    Write-Host $StartingMessage -ForegroundColor Yellow

    $solutionPath = Get-SolutionPath
    $solutionFile = [System.IO.Path]::GetFileNameWithoutExtension($solutionPath)
    $cmd = { msbuild.exe $solutionPath /target:$Target /property:Configuration=$Configuration /verbosity:$Verbosity /nologo }
    $errorMessage = $ErrorMessage.Replace("{SolutionFile}", $solutionFile)

    Set-MSBuildEnvironment
    Exec $cmd $errorMessage
    
    Write-Host $SuccessfulMessage.Replace("{SolutionFile}", $solutionFile) -ForegroundColor Green    
}
