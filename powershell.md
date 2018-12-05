# PowerShell tips and tricks

## Check if you can connecto to a tcp port on a host
```
Test-NetConnection -Port 80 -ComputerName vg.no
```
Reference: https://docs.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection?view=win10-ps
