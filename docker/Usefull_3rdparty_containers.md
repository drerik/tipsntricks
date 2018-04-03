# Usefull 3rd party docker containers
*Note:* Use them on your own responsibility


## Simple sfp instance
https://github.com/atmoz/sftp

You can launch it by using docker-compose and creating the following `docker-compose.yml` file
```
sftp:
    image: atmoz/sftp
    volumes:
        - $HOME/ftp-uploader:/home/uploader
    ports:
        - "2222:22"
    command: uploader:password:1011
```

To upload to the sftp server, simply connect using the sftp command or equalent app. Password in the example is "password"
```
sftp -P 2222 uploader@185.55.107.196
```
## Openvpn server
Simple setup for a openvpn server with docker based on https://github.com/kylemanna/docker-openvpn
Here's the docker-compose doc: https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md

### docker-compose.yml
```
version: '3'
services:
  openvpn:
    image: kylemanna/openvpn
    restart: always
    ports:
      - "1194:1194/udp"
    volumes:
      - "vpn:/etc/openvpn"
    cap_add:
      - NET_ADMIN
volumes:
  vpn:
```

If you use ufw as firewall, you can open up the port with `sudo ufw allow 1194/udp`

