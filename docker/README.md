# Docker tips and dricks

## Dockerfile tips
### Move /var/lib/docker to a dedicated partition

- Create a volume/drive and mount it to the instance/server

- Partition and format it with ext4
```
DRIVE=/dev/vdc
sfdisk $DRIVE -uM << EOF
,
;
EOF

mkfs.ext4 -j $DRIVE"1"
```

- Gett UUID with `blkid` command and add to fstab
```
cp /etc/fstab{,.backup}
DRIVE_UUID=$(blkid -o value -s UUID $DRIVE"1")
echo "UUID=$DRIVE_UUID               /var/lib/docker    ext4    defaults        0 0" >> /etc/fstab
```
- Stop Docker deamon
```
service docker stop

```
- Move data from old to new folder
```
mv /var/lib/docker /var/lib/docker.old
mkdir /var/lib/docker
mount /var/lib/docker
cp -rfp /var/lib/docker.old/* /var/lib/docker/
```

- Start docker deamon
```
service docker start
```

### Set timezone in a container
```
echo "Europe/Oslo" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
```

## Cleanup
### Remove untagged/dangling images
```
docker rmi $(docker images -q -f dangling=true)
```

## Stats
### Get disk usage
Needs an improvement, has to run on host.
```


for d in `docker ps | awk '{print $1}' | tail -n +2`; do
    d_name=`docker inspect -f {{.Name}} $d`
    echo "========================================================="
    echo "$d_name ($d) container size:"
    echo "$d_name ($d) volumes:"
    for mount in `docker inspect -f "{{range .Mounts}} {{.Source}}:{{.Destination}}{{end}}" $d`; do
        size=`echo $mount | cut -d':' -f1 | sudo xargs du -d 0 -h`
        mnt=`echo $mount | cut -d':' -f2`
        echo "$size mounted on $mnt"
    done
done
```

### Get log size for containers
```
ls -lh /var/lib/docker/containers/*/*-json.log
```
Alternative with find command:
```
sudo find /var/lib/docker/containers -iname '*-json.log' -exec ls -lh {} \;
```

## Docker inspect trics
### Get the docker-compose service name of a container
```
docker inspect --format='{{index .Config.Labels "com.docker.compose.service"}}' $CONTAINER
```
