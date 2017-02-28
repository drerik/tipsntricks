# Bind DNS server tips and tricks


## Flush dns cache
To flush the whole cache:
```
rndc flush
```

To flush only entries from one domain:
```
rndc flush domain.com
```
