powershell.exe -command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1' -OutFile %SystemRoot%\Temp\ConfigureRemotingForAnsible.ps1"
powershell.exe -ExecutionPolicy ByPass -File %SystemRoot%\Temp\ConfigureRemotingForAnsible.ps1 -EnableCredSSP -DisableBasicAuth
