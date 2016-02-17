Function Get-PackagesDirectory {
    $solutionDirectory = Get-SolutionDirectory
    return [System.IO.Path]::Combine($solutionDirectory, "packages")
}
