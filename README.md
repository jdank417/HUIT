**HUIT-IZER PowerShell Script**



**Overview**
The HUIT-IZER PowerShell script automates the setup of essential software and configurations on a computer within HUIT (Harvard University Information Technology). It downloads and optionally opens several key applications and resources typically used within the organization.

**Functionality**
The script performs the following tasks:

**Downloads Essential Software:**
Downloads several executable files to the desktop:
HUIT_ToolKit.exe
ChromeSetup.exe
Firefox Installer.exe
OfficeSetup.exe
Creative_Cloud_Set-Up.exe
Each download is logged in download_log.txt located on the desktop.

**Opens Downloaded Files:**
After downloading each file, it prompts the user to confirm before opening it. This ensures user control over executing downloaded applications.
Opens Important Websites:



**Opens key URLs relevant to HUIT operations, including:**
VPN Access
Zoom Client Download
Google Doc with helpful Links and other documentation of common and not-so-common processes

**Additional Actions:**
Opens Windows Update settings to ensure system updates are current.
Logging:
All activities are logged in download_log.txt for traceability and troubleshooting purposes.
Usage


**Prerequisites:**
Ensure PowerShell is enabled on your system (Set-ExecutionPolicy RemoteSigned or Set-ExecutionPolicy Bypass -Scope Process might be required depending on your environment).
**Ensure internet connectivity to download files.**


**Running the Script:**
Download HUIT-IZER.ps1 and run.bat to your computer then run the batch file; run.bat
Follow the prompts to confirm opening downloaded files.

**Reviewing Output:**
Check download_log.txt on your desktop for detailed logging of each operation.
Security Considerations
File Sources: Verify the integrity and trustworthiness of downloaded files from GitHub (https://github.com/jdank417/HUIT).
User Interaction: User confirmation is required before opening downloaded files, ensuring safe execution.
Logging: Logs provide visibility into script activities for accountability and troubleshooting.
Support
For questions or assistance with the script, please contact Jason Dank - Technical Support Engineer Intern (Feild Tech - Allston / SEAS) - jason_dank@harvard.edu
