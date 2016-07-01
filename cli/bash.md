# Bash commandline tips

## Get all servername and serveralias entries from apache configs
```
 egrep  '^.*ServerName|^.*ServerAlias' apache2/sites/*.conf | tr -s ' ' | sed 's/^\s//' | cut -d ' ' -f 2
```

## Replace multiple spaces with one space
```
$ echo "   s e  e ww sss    eee" | tr -s " "
 s e e ww sss eee
```


## Get ip of ethernet device
```
ip addr show dev eth0 | grep inet\ | tr -s " " | cut -d' ' -f 3 | cut -d'/' -f 1
```
