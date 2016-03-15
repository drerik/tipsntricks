# Docker tips and dricks

## Cleanup
### Remove untagged/dangling images
```
docker rmi $(docker images -q -f dangling=true)
```
