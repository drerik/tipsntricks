# Coreos related tips and tricks

## Add a temporarily swap partition
Run the following command to enable a swap file half the size of the physical memory
```
curl -o /tmp/swapon.sh https://raw.githubusercontent.com/drerik/tipsntricks/master/coreos/swapon.sh && /bin/bash /tmp/swapon.sh
```

Or, do it manually.
```
sudo fallocate -l 4G /swap
sudo /usr/sbin/mkswap /swap
sudo chmod 0600 /swap
sudo /usr/sbin/swapon /swap
```

## To permanent add swap mem
See the coreos doc on the subject https://coreos.com/os/docs/latest/adding-swap.html


## Force update a coreos instance
If you have disabled the automatic update, you can update the instace like this:
```
sudo systemctl start update-engine.service
sudo update_engine_client -update
```
