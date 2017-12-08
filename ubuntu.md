# Ubuntu Tips and tricks

## Standard firewall setup
```
sudo ufw allow from 14.15.16.16/28  to any port 22
sudo ufw allow icmp
sudo ufw allow http
sudo ufw allow https

```
To enable traffic to all ports from a network do:
```
sudo ufw allow from 192.168.1.0/24
```


## Links
- https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands
