Function Get-TestsDirectory {
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory)        
    )
    return [System.IO.Path]::Combine($SolutionDirectory, "tests")
}