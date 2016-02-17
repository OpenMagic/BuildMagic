Function Get-ProjectName {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectDirectory
    )
    $projectPath = Get-ProjectPath -ProjectDirectory $ProjectDirectory
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($projectPath)
    return $projectName
}