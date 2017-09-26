
## Set libvirt to complain:
```
sudo apt install apparmor-utils

```

## Configure new instance
virt-install --connect qemu:///system \
             --import \
             --name container-linux2 \
             --ram 1024 --vcpus 1 \
             --os-type=linux \
             --os-variant=virtio26 \
             --disk path=/var/lib/libvirt/images/container-linux/container-linux2.qcow2,format=qcow2,bus=virtio,size=20 \
             --vnc --noautoconsole \
             --print-xml --dry-run




## Fix apparmor stopping virsh to start container
```

sudo aa-complain /etc/apparmor.d/libvirt/libvirt-<instance-uuid>
```
Maybe better is to fix the problem. for more info: https://stackoverflow.com/questions/10817813/apparmor-causes-issues-on-libvirt-with-custom-qemu


## connect to console from host:
```
virsh console container-linux1
```

- to escape Ctrl+] or Ctrl+å

## Links
- https://help.ubuntu.com/lts/serverguide/apparmor.html
- https://coreos.com/os/docs/latest/booting-with-libvirt.html
- https://superuser.com/questions/637669/how-to-exit-a-virsh-console-connection


---

container-linux virt: b971ddd5-74d7-4041-9088-48a143fde2a7
