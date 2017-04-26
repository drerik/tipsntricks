# Java related tips and tricks

## Dump mem to a spesific file on outOfMem
Add this environment variable before starting the JVM. Memory will then be dumped to /heapdump.hprof
```
JAVA_OPTS="$JAVA_OPTS -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/heapdump.hprof"
```

