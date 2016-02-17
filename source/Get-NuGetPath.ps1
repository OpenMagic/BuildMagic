Function Get-NuGetPath {
    $packagesDirectory = Get-PackagesDirectory
    return [System.IO.Path]::Combine($packagesDirectory, "NuGet.exe")
}