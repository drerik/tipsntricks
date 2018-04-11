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


## Send email with telnet
- Connect to the server with telnet
```
telnet smtp.mailserver.com 25
```
- Modify the text below and paste it in to the telnet session
```
HELO test.mailtest.com
MAIL FROM: <sender@gmail.com>
RCPT TO: <your@email.com>
DATA
From: mailtest <sender@gmail.com>
Subject: testmail3
this is a test
.
QUIT
```

## Check yaml file for errors
Exit 0 if ok, or stacktrace if not.
```
python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < yourfile.yaml
```

## Delete a specified string in a file
ex. Deletes string 237 from /root/.ssh/known_hosts:
```
sudo sed -i.old '237d' /root/.ssh/known_hosts
```

## Wait on user to continue
```
read -n 0 -i "--Press enter to continue--"
```

## Process each line in a variable/command
```
while read -r line; do
    echo "hello $line" # Do something with $line
done <<< "$(something that generates multiple lines)"
```

## echo a string to stderr
```
echo "this is a error" 1>&2
```


## Simple timestamp
```
TS=$(date +%F-%H-%M-%S.%N)
```


## Get git status on multiple subfolders
1 = uncommitted

0 = all changes committed
```
for project in $(ls -1) ; do echo -n "$project: " ; git status $project | grep "nothing to commit" | echo $?  ; done
```

## Save output to a file and exit code to another file for the same command
```
  ./myscript.sh 2>&1 | tee /var/log/myscript.log ; echo "${PIPESTATUS[0]}" > /var/log/myscript.exitcode
```

## Pretty print json
```
cat somefile.json | python -m json.tool
```
