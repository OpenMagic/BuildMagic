# Ensure's NuGet.exe is in .\packages directory
Function Install-NuGet
{
    $packagesDirectory = Get-PackagesDirectory
    $nuGetPath = Get-NuGetPath
    $nuGetUrl = "http://nuget.org/NuGet.exe"

    Write-Host "Installing NuGet.exe..." -ForegroundColor Yellow

    if (-Not (Test-Path $packagesDirectory)) {
        Write-Host "Creating directory '$packagesDirectory'..."
        New-Item -Path $packagesDirectory -Type Directory | Out-Null
        Write-Host "Successfully created directory '$packagesDirectory'..."
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