#  OSX commandline tricks

## Add a ip temporarily to a network interface
Use the command:
```
sudo ifconfig tap0 alias 192.168.100.102/24
```
Example:
```
$ ifconfig tap0
tap0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
    ether d6:d4:c4:82:1d:6d
    inet 10.0.6.202 netmask 0xffffff00 broadcast 10.0.6.255
    media: autoselect
    status: active
    open (pid 42893)
$ sudo ifconfig tap0 alias 192.168.100.102/24
$ ifconfig tap0
tap0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
    ether d6:d4:c4:82:1d:6d
    inet 10.0.6.202 netmask 0xffffff00 broadcast 10.0.6.255
    inet 192.168.100.102 netmask 0xffffff00 broadcast 192.168.100.255
    media: autoselect
    status: active
    open (pid 42893)
$
```

## Add user to group weel
Replace <user> with your username
```
sudo dseditgroup -o edit -a <user> -t user wheel
```
