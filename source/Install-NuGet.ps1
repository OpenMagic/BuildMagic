# Ensure's NuGet.exe is in .\packages directory
Function Install-NuGet
{
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        $SolutionDirectory = $(Get-SolutionDirectory),

        [ValidateNotNullOrEmpty()]
        [string]
        $PackagesDirectory = $(Get-PackagesDirectory)
    )

    $nuGetPath = Get-NuGetPath
    $nuGetUrl = "http://nuget.org/NuGet.exe"

    Write-Host "Installing NuGet.exe..." -ForegroundColor Yellow

    if (-Not (Test-Path $PackagesDirectory)) {
        Write-Host "Creating directory '$PackagesDirectory'..."
        New-Item -Path $PackagesDirectory -Type Directory | Out-Null
        Write-Host "Successfully created directory '$PackagesDirectory'..."
    }

    if (Test-Path $nuGetPath) {
        Write-Host "NuGet.exe is already installed."
    }
    else {
        Write-Host "Downloading 'NuGet.exe'..."
        $webclient = New-Object System.Net.WebClient
        $webclient.DownloadFile($nuGetUrl, $nuGetPath)
        Write-Host "Successfully downloaded 'NuGet.exe'."
    }

    Write-Host "Successfully installed NuGet.exe." -ForegroundColor Green
}