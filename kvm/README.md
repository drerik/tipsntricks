# KVM tips and tricks



# Installing virt-manager and virt-viewer on osx
```
brew tap jeffreywildman/homebrew-virt-manager
brew install virt-manager virt-viewer
```
More info:  https://github.com/jeffreywildman/homebrew-virt-manager

# Connection to a remote desktop on
- Make shure you have your ssh key added to kvm host
- Run the follwing command to connect to that spesific vm
```
virt-viewer --connect qemu+ssh://user@host.example.com/system vmnamehere
```
If you are running virt-viewer from osx you need to add `?socket=/var/run/libvirt/libvirt-sock` to the uri:
```
virt-viewer --connect qemu+ssh://user@host.example.com/system?socket=/var/run/libvirt/libvirt-sock vmnamehere
```