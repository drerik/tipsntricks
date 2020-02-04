# Certificate tips and tricks

## Add a root CA public certificate to your truststore on linux

Make shure that your certificate is in PEM format and it ends with .crt

```bash
# Create a folder for your certificates in /usr/share/ca-certificates
sudo mkdir /usr/share/ca-certificates/extra

# Copy your CA's public key to that folder
sudo cp your-ca.crt /usr/share/ca-certificates/extra/.

# Configure trust store with your new certificate
# To run it interactivly, run this one instead: sudo dpkg-reconfigure ca-certificates
sudo update-ca-certificates
```
