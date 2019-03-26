# Hyper-v and powershell tips and tricks

See https://docs.microsoft.com/en-us/powershell/module/hyper-v/ for full documentation.

Omit `-ComputerName remote_hypervisor` if you are working wit virtual machins on a localhost.

## Start a virtual machine

```powershell
Start-VM -ComputerName remote_hypervisor -Name vm_name
```

## Stop a virtual machine

```powershell
Stop-VM -ComputerName remote_hypervisor -Name vm_name
```

## Snapshots

### List snapshots from a virtual machine

```powershell
Get-VMSnapshot -ComputerName remote_hypervisor -VMName vm_name
```


### Snapshot a snapshot from a virtual machine

```powershell
Checkpoint-VM -VMName vm_name -SnapshotName snapshot_name -ComputerName remote_hypervisor
```


### Remove a snapshot from a virtual machine

```powershell
Remove-VMSnapshot -VMName vm_name -Name snapshot_name -ComputerName remote_hypervisor
```

### Restore a snapshot from a virtual machine

```powershell
Restore-VMSnapshot -ComputerName remote_hypervisor -VMName vm_name -Name snapshot_name
```
