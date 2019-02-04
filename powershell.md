# PowerShell tips and tricks
Official Powershell documentation: https://docs.microsoft.com/en-us/powershell/

## Check if you can connect to a tcp port on a host
```
Test-NetConnection -Port 80 -ComputerName vg.no
```
Reference: https://docs.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection?view=win10-ps


## Make Powershell scripts fail on error
If a error happens in a powershell script, the default behaviour is to continue. But if you set the `$ErrorActionPreference` variable you can change it.

Here are the options:
- `SilentlyContinue`: Continues and does not show error messages
- `Continue`: Displays a error message and continues the script. This is the default behaviour.
- `Inquire`: Ask the user if the script shall continue.
- `Stop`: Halts the script with an error.

```
# Halts the script when a function fails
function FailFunction {
    This function fails
}

$ErrorActionPreference = "Stop"

Write-Host("Sentence before fail")
FailFunction
Write-Host("Sentence after fail")

```
