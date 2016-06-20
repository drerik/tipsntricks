# Docker tips and dricks

## Dockerfile tips

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