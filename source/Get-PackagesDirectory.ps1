Function Get-PackagesDirectory {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory)
    )
    return [System.IO.Path]::Combine($SolutionDirectory, "packages")
}
