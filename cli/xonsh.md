# xonsh sniplets

## List ips that re active in a list
```
for $IP in read_file("Downloads/iplist.txt"):
    cmd = !(ping -q -c 1 $IP)
    if cmd.returncode != 0:
        print($IP)

```
