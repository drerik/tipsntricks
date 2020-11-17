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

## Validate certificates with md5 or other hash

To validate a certificate, you can create a md5 checksum that you can validate against each other.

```bash
openssl x509 -noout -modulus -in certificate.crt | openssl md5
openssl rsa -noout -modulus -in privateKey.key | openssl md5
openssl req -noout -modulus -in CSR.csr | openssl md5
```
