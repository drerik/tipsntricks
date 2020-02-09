# Thunderbolt 3 tips and tricks
- Arch guide: https://wiki.archlinux.org/index.php/Thunderbolt
## Authorizing a Thunderbolt 3 dock

1. Use the tool boltctrl to list connected thunderbolt docs
```bash
$ boltctl list
 ● CalDigit, Inc. TS3
   ├─ type:          peripheral
   ├─ name:          TS3
   ├─ vendor:        CalDigit, Inc.
   ├─ uuid:          009278c0-29b7-3d00-ffff-ffffffffffff
   ├─ status:        connected
   │  ├─ domain:     cc030000-00a0-9f18-a366-6b0d6aa3a820
   │  └─ authflags:  none
   ├─ connected:     sø. 09. feb. 2020 kl. 19.44 +0000
   └─ stored:        no

$
```

2. Enroll the dock to always approve devices on the dock
```bash
$ boltctl enroll 009278c0-29b7-3d00-ffff-ffffffffffff
 ● CalDigit, Inc. TS3
   ├─ type:          peripheral
   ├─ name:          TS3
   ├─ vendor:        CalDigit, Inc.
   ├─ uuid:          009278c0-29b7-3d00-ffff-ffffffffffff
   ├─ dbus path:     /org/freedesktop/bolt/devices/009278c0_29b7_3d00_ffff_ffffffffffff
   ├─ status:        authorized
   │  ├─ domain:     cc030000-00a0-9f18-a366-6b0d6aa3a820
   │  ├─ parent:     cc030000-00a0-9f18-a366-6b0d6aa3a820
   │  ├─ syspath:    /sys/devices/pci0000:00/0000:00:1d.0/0000:06:00.0/0000:07:00.0/0000:08:00.0/domain0/0-0/0-1
   │  └─ authflags:  none
   ├─ authorized:    sø. 09. feb. 2020 kl. 19.56 +0000
   ├─ connected:     sø. 09. feb. 2020 kl. 19.44 +0000
   └─ stored:        sø. 09. feb. 2020 kl. 19.56 +0000
      ├─ policy:     auto
      └─ key:        no

$
```
