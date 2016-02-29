Function Get-psakePath {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory -SolutionDirectory $SolutionDirectory)
    )
    return [System.IO.Path]::Combine($packagesDirectory, "psake\tools\psake.psm1")
}