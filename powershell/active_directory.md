# Active Directory Powershell tips

## Get a users group memberships

```powershell
Get-ADPrincipalGroupMembership <username> | select name
```
