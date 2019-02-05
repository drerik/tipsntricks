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

## Show full output of a powershell object

To show all properties of a object you can pipe it to `select`
```
 Get-VM -Name MobyLinuxVM |  select *
```
And get a set of properties, change the wildcard to the properties you want
```
 Get-VM  |  select Name, State, Path
 ````
 
 ## Print out debug messages when developing script
 Set `$DebugPreference` to change the way powershell behave on errors.
 Options:
 - SilentlyContinue (Default): Ignores debug medssages and continues
 - Stop: stops on Write-Debug or other debugging messages
 - Inquire: Asks you if you want to continue on every debug message
 - Continue: Displays the error message and continues.
 
 
 ```
 $DebugPreference = "Continue"
 ```
