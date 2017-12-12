# Setting up huawei E3131 modem
To set mode, see `setmode.sh`

## set modem mode with usb_modeswitch
Put the following content in /etc/usb_modeswitch.d/12d1\:1f01 :
```
# Huawei E3531
TargetVendor=0x12d1
TargetProduct=0x1442
MessageContent="55534243123456780000000000000011062000000101000100000000000000"
```
