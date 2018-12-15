# Tips on ansible and windows

## Setting WinRM up on host
Configures WinRM with CredSSP enabled and BasicAuth disabled
```
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file -EnableCredSSP -DisableBasicAuth

```
