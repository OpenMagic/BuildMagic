Function Get-ProjectPath {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectDirectory
    )
    $projects = Get-ChildItem -Path $ProjectDirectory -File -Filter "*.*proj"
    
    if ($projects.Count -eq 0) {
        throw "Cannot find project in directory '$ProjectDirectory'."
    }
    
    if ($projects.Count -gt 1) {
        throw "Cannot handle more than one project in directory '$ProjectDirectory'."
    }
    
    return $projects[0].FullName
}