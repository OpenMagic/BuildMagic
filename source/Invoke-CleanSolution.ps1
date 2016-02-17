Function Invoke-CleanSolution {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Configuration,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Verbosity
    )
    Invoke-MSBuild `
        -Target "Clean" `
        -Configuration $Configuration `
        -Verbosity $Verbosity `
        -StartingMessage "Cleaning solution..." `
        -ErrorMessage "Error while cleaning solution '{SolutionFile}'." `
        -SuccessfulMessage "Successfully cleaned solution '{SolutionFile}'." `
}