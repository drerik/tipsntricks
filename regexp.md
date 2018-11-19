# Regular expressions tips and tricks

## Find one or more spaces and tabs
Nice to use when you want to replace them with `,` for example.
```
 {1,}|\t{1,}
```
