# xonsh sniplets

## List ips that re active in a list
```
for $IP in read_file("Downloads/iplist.txt"):
    cmd = !(ping -q -c 1 $IP)
    if cmd.returncode != 0:
        print($IP)

```


## Wait for a host to reconnect ( ping wait )
```
import time
while True:
   ping_cmd = !(ping -q -c 1 -t 1 10.0.6.31)
   if ping_cmd.returncode == 0:
       break
   else:
       print(".")
   time.sleep(1)
```
