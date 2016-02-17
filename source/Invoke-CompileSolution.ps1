Function Invoke-CompileSolution {    
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
        -Target "ReBuild" `
        -Configuration $Configuration `
        -Verbosity $Verbosity `
        -StartingMessage "Compiling solution..." `
        -ErrorMessage "Error while compiling solution '{SolutionFile}'." `
        -SuccessfulMessage "Successfully compiled solution '{SolutionFile}'." `
}
