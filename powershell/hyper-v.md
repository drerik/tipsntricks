# Hyper-v and powershell tips and tricks




## Snapshots
Omit `-ComputerName remote_hypervisor` if you are working wit virtual machins on a localhost.

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
