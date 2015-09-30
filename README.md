### Spot-Graphite Module

We use this module to send [logon information]((https://github.com/spottradingllc/get-logins-to-graphite) from Windows servers to our Graphite server so we can use that information in [UnusedServers PowerShell module](https://github.com/spottradingllc/unused-servers).

### Installation

1. Determine PowerShell modules directory you want to use (type `$env:PSModulePath` and chose one, for example `c:\Windows\system32\WindowsPowerShell\v1.0\Modules`).
2. Download repo and place all files under Modules directory you chose in the first step into `Spot-Graphite` folder (`c:\Windows\system32\WindowsPowerShell\v1.0\Modules\Spot-Graphite`).
3. Make sure the files are not blocked. Right click on the files and un-block them by going into properties.
4. Make sure to set your PowerShell Execution Policy to `RemoteSigned`, for example `Set-ExecutionPolicy RemoteSigned -Force`.
5. Type `Get-Module -ListAvailable` and make sure you see Spot-Graphite module in the list

### Usage

`Send-ToGraphite -GraphiteServer <graphite server name> -CustomPath <graphite path> -Value <data point to send> -Time <time stamp>`

`-GraphiteServer`: Name of the Graphite server

`-CustomPath`: Graphite data path. For example test_server.logins.count

`-Value`: Data value to send to Graphite server

`-Time`: Time stamp for data point. It will be converted to epoch time by the module

