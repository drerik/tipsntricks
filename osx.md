# OSX tips and tricks

## Controlling ssh service from cli
```
# Get status
sudo systemsetup -getremotelogin
#  Enable ssh
sudo systemsetup -setremotelogin on
# Disable ssh
sudo systemsetup -setremotelogin off

```


## Flush local dns cache
- On osx sierra ( 10.12 ) and greater:
```
sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache
```
