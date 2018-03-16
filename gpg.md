# Tips and tricks for GnuPG


## Trust all keys in your keystore trough a oneliner
```
gpg --list-keys --fingerprint --with-colons | sed -E -n -e 's/^fpr:::::::::([0-9A-F]+):$/\1:6:/p' | gpg --import-ownertrust
```
