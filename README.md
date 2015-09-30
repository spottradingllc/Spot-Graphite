### Spot-Graphite Module

We use this module to send logon information from Windows servers to our Graphite server (https://github.com/spottradingllc/get-logins-to-graphite) so we can use that information in Unused Servers module (https://github.com/spottradingllc/unused-servers).

### Installation

1. Determine PowerShell modules directory you want to use (type `$env:PSModulePath` and chose one, for example `c:\Windows\system32\WindowsPowerShell\v1.0\Modules`).
2. Download repo and place all files under Modules directory you chose in the first step into `Spot-Graphite` folder (`c:\Windows\system32\WindowsPowerShell\v1.0\Modules\Spot-Graphite`).
3. Make sure the files are not blocked. Right click on the files and un-block them by going into properties.
4. Make sure to set your PowerShell Execution Policy to `RemoteSigned`, for example `Set-ExecutionPolicy RemoteSigned -Force`.
5. Type `Get-Module -ListAvailable` and make sure you see Spot-Graphite module in the list

### Usage

`Send-ToGraphite -Graphite <graphite server name>` 
