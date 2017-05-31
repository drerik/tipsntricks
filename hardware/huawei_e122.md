# Setting up a Huawei E122 Modem under ubuntu 16.04
You can buy it from here: https://www.aliexpress.com/item/Huawei-E122-HSDPA-HSUPA-Mobile-Broadband-3-5G-USB-Modem-7-2Mbps-Free-Shipping/591573523.html

## Setting up as usb serial device

Commandline:
```
sudo usb_modeswitch -v 12d1 -p 1446 -J
```

## udev rules
- Create the file `/etc/udev/rules.d/huawei.rules` and add the following content:
```
ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="12d1", ATTRS{idProduct}=="1446", RUN+="/usr/sbin/usb_modeswitch -v 12d1 -p 1446 -J"
```
- Restart udev
```
sudo systemctl status udev
```
