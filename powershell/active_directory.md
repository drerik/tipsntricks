# Active Directory Powershell tips

## Get a users group memberships

```powershell
Get-ADPrincipalGroupMembership <username> | select name
```

## Copy group memberships from one user to another

```powershell
Get-ADUser -Identity <old_user> -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members <new_user>
```
