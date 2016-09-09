# Byobu cheatsheed

## Disconnect all other connections on host
```
/usr/lib/byobu/include/tmux-detach-all-but-current-client
```

## Detach a remote session
```
$ byobu list-clients
/dev/pts/2: 1 [181x53 xterm-256color] (utf8)
/dev/pts/4: 1 [226x54 xterm-256color] (utf8)
$ byobu detach -t /dev/pts/2
```
