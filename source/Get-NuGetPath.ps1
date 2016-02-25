Function Get-NuGetPath {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory -SolutionDirectory $SolutionDirectory)
    )
    return [System.IO.Path]::Combine($packagesDirectory, "NuGet.exe")
}