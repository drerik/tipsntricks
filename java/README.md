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

## Mat: Memory dump analyzing tool
Use Mat ( http://www.eclipse.org/mat/ ) to analyze the dump.


## Get pid of a spesified java app
This command returns the pid number of java application with class `com.enonic.xp.launcher.LauncherMain`
```
jps -l | grep com.enonic.xp.launcher.LauncherMain | cut -d' ' -f1
```

## Running java applets from appletviewer ( commandline )
Define permissions for your java applet in `$JAVA_HOME/jre/lib/security/java.polic`, this will allow all permissions to the applet on the specified path:
```
grant codeBase "https://yourserver.com/applet_path/-" {
  permission java.security.AllPermission;
};
```

Run the applet with the following command:
```
$JAVA_HOME/bin/appletviewer.exe https://yourserver.com/applet_path/index.html
```

