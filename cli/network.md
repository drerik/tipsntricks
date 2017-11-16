# Network tricks

## Using nc to verify that you can establish a tcp connection on a specific port to a machine (server1) from another one (server2)
On server1:
```
[root@server1 hosts]# echo 'its open!' > /tmp/test.txt
[root@server1 hosts]# cat /tmp/test.txt | nc -l 10017
[root@server1 hosts]#
```

on server2:
```
[root@server2 hosts]# nc nokc-server1.enonic.net 10017
its open!
[root@server2 hosts]#
```
