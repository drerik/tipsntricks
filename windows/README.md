# Windows tips and tricks


## Disk drive performance tester
You can test disk performance with the `winsat` command.
```
# Test performance on drive c
winsat disk -drive  c
```
Ref: http://technet.microsoft.com/en-us/library/cc742157.aspx

## Extend windows server evaluation period from 6 months

To see how many times you can rearm the server run the following command in a cmd.exe shell with administrator privileges

```
cscript.exe %windir%\system32\slmgr.vbs /dlv
```

To extend the period, run the folling command in a cmd.exe shell with administrator privileges

```
cscript.exe %windir%\system32\slmgr.vbs /rearm
```

Then reboot the server.

You can rearm your server up to 6 times.
