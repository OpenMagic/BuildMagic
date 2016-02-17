Function Get-XUnitPath {
    param(
        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory)
    )
    $xunitDirectories = Get-ChildItem -Path $PackagesDirectory -Directory -Filter "xunit.runner.console*"
    
    if ($xunitDirectories.Count -eq 0) {
        throw "Cannot find xunit.runner.console in directory '$PackagesDirectory'."
    }
    
    if ($xunitDirectories.Count -gt 1) {
        throw "Cannot handle more than one xunit.runner.console in directory '$PackagesDirectory'."
    }
    
    $xunitDirectory = $xunitDirectories[0]
    $xunitPath = [System.IO.Path]::Combine($xunitDirectory.FullName, "tools\xunit.console.exe")
    
    if (-not (Test-Path $xunitPath)) {
        throw "Cannot find xUnit console runner '$xunitPath'."        
    }
    
    return $xunitPath
}