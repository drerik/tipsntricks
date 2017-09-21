# Java related tips and tricks

## Get Memory utilization for jvm
```
jstat -gcutil <pid>
```

## Dump stacktrace to stdout
Add -F if the process is hung.
```
jstack [-F] <pid>
```

## Dump heap mem to file
Add -F if the process is hung.
```
jmap [-f] -dump:format=b,file=<destination file> <pid>
```

## Dump mem to a spesific file on outOfMem
Add this environment variable before starting the JVM. Memory will then be dumped to /heapdump.hprof
```
JAVA_OPTS="$JAVA_OPTS -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/heapdump.hprof"
```

