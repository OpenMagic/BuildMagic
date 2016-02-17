# Searches for the solution file in repository's root directory
Function Get-SolutionPath {
        
    $solutionDirectory = Get-SolutionDirectory

    $files = Get-ChildItem -Path $solutionDirectory -File -Filter "*.sln"

    If ($files.Count -eq 0)
    {
        throw "Cannot find solution file."
    }

    If ($files.Count -gt 1)
    {
        throw "More than 1 solution file is not supported, yet!"
    }

    return $files.FullName
}