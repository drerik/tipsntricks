# Coreos related tips and tricks

## Add a temporarily swap partition
```
sudo fallocate -l 4G /swap
sudo /usr/sbin/mkswap /swap
sudo chmod 0600 /swap
sudo /usr/sbin/swapon /swap
```
