# Define desktop path
$desktop = [Environment]::GetFolderPath('Desktop')

# Define log file
$logfile = "$desktop\download_log.txt"
"Download Log" | Out-File -FilePath $logfile

# Function to download a file
function Download-File {
    param (
        [string]$url,
        [string]$output
    )

    Write-Output "Downloading $output from $url..." | Tee-Object -FilePath $logfile -Append
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
        $fileInfo = Get-Item $output
        if ($fileInfo.Length -lt 1000) {
            Write-Output "$output is too small, possibly corrupted" | Tee-Object -FilePath $logfile -Append
            return $false
        }
        Write-Output "$output downloaded successfully, size: $($fileInfo.Length) bytes" | Tee-Object -FilePath $logfile -Append
        return $true
    }
    catch {
        Write-Output "Failed to download $output" | Tee-Object -FilePath $logfile -Append
        return $false
    }
}

# Function to open a file with user confirmation
function Open-FileWithConfirmation {
    param (
        [string]$file
    )

    $fileName = (Get-Item $file).Name
    $confirmation = Read-Host "Do you want to open '$fileName'? (Y/N)"
    if ($confirmation -eq "Y" -or $confirmation -eq "y") {
        Start-Process $file
    }
}

# Function to open a URL in the default web browser
function Open-Website {
    param (
        [string]$url
    )
    Start-Process $url
}

# Download HUIT_ToolKit.exe to desktop
$chromeUrl = "https://github.com/jdank417/HUIT/raw/main/HUIT_ToolKit.exe"
$chromeOutput = "$desktop\HUIT_ToolKit.exe"
if (-not (Download-File -url $chromeUrl -output $chromeOutput)) {
    Write-Output "Error occurred during downloading HUIT_ToolKit.exe. Exiting..." | Tee-Object -FilePath $logfile -Append
    exit
}
Open-FileWithConfirmation -file $chromeOutput

# Download ChromeSetup.exe to desktop
$chromeUrl = "https://github.com/jdank417/HUIT/raw/main/ChromeSetup%20(3).exe"
$chromeOutput = "$desktop\ChromeSetup.exe"
if (-not (Download-File -url $chromeUrl -output $chromeOutput)) {
    Write-Output "Error occurred during downloading ChromeSetup.exe. Exiting..." | Tee-Object -FilePath $logfile -Append
    exit
}
Open-FileWithConfirmation -file $chromeOutput

# Download FireFoxSetup.exe to desktop
$firefoxUrl = "https://github.com/jdank417/HUIT/raw/main/Firefox%20Installer%20(1).exe"
$firefoxOutput = "$desktop\Firefox Installer.exe"
if (-not (Download-File -url $firefoxUrl -output $firefoxOutput)) {
    Write-Output "Error occurred during downloading FireFoxSetup.exe. Exiting..." | Tee-Object -FilePath $logfile -Append
    exit
}
Open-FileWithConfirmation -file $firefoxOutput

# Download OfficeSetup.exe to desktop
$officeUrl = "https://github.com/jdank417/HUIT/raw/main/OfficeSetup%20(1).exe"
$officeOutput = "$desktop\OfficeSetup.exe"
if (-not (Download-File -url $officeUrl -output $officeOutput)) {
    Write-Output "Error occurred during downloading OfficeSetup.exe. Exiting..." | Tee-Object -FilePath $logfile -Append
    exit
}
Open-FileWithConfirmation -file $officeOutput

# Download Creative Cloud Set-Up.exe to desktop
$adobeUrl = "https://github.com/jdank417/HUIT/raw/main/Creative_Cloud_Set-Up.exe"
$adobeOutput = "$desktop\Creative_Cloud_Set-Up.exe"
if (-not (Download-File -url $adobeUrl -output $adobeOutput)) {
    Write-Output "Error occurred during downloading Creative_Cloud_Set-Up.exe. Exiting..." | Tee-Object -FilePath $logfile -Append
    exit
}
Open-FileWithConfirmation -file $adobeOutput

Write-Output "All files have been downloaded to the desktop." | Tee-Object -FilePath $logfile -Append

# Define URLs to open
$websites = @(
    "https://vpn.harvard.edu",
    "https://harvard.zoom.us/download",
    "https://docs.google.com/document/d/15BPbmeNYxCJZrB4Ur7wEg1q6Ga6TFCS69BlWd4KjYkY/edit?usp=sharing"
)

# Open each website
foreach ($site in $websites) {
    Write-Output "Opening website: $site"
    Open-Website -url $site
}

Write-Output "All websites have been opened."

# Open Windows Update settings
Write-Output "Opening Windows Update settings..."
Start-Process "ms-settings:windowsupdate"

# Pause at the end
pause
