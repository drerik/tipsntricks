# Bash commandline tips

## Get all servername and serveralias entries from apache configs
```
 egrep  '^.*ServerName|^.*ServerAlias' apache2/sites/*.conf | tr -s ' ' | sed 's/^\s//' | cut -d ' ' -f 2
```
