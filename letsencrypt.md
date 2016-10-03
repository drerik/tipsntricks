# Let's Encrypt

## Adding Let's Encrypt root certificates to a java app.
Let's Encrypts certificates are awsome! However with java their ca certificates was missing before Java 8u101. In prior versions of java, you have to that you had to them manually.
Here's how:
- Add a trust store to your java options ( or, you can also add them to the default one ):
```
JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=/path/to/truststore -Djavax.net.ssl.trustStorePassword=123456"
```
- Download certificates and import them into the trust store using wget and keytool.
```
wget -O /tmp/isrgrootx1.pem https://letsencrypt.org/certs/isrgrootx1.pem
wget -O /tmp/lets-encrypt-x3-cross-signed.der https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der
wget -O /tmp/lets-encrypt-x4-cross-signed.der https://letsencrypt.org/certs/lets-encrypt-x4-cross-signed.der

keytool -trustcacerts -keystore /path/to/truststore -storepass 123456 -noprompt -importcert -alias isrgrootx1 -file /tmp/isrgrootx1.pem
keytool -trustcacerts -keystore /path/to/truststore -storepass 123456 -noprompt -importcert -alias letsencryptauthorityx3 -file /tmp/lets-encrypt-x3-cross-signed.der
keytool -trustcacerts -keystore /path/to/truststore -storepass 123456 -noprompt -importcert -alias letsencryptauthorityx4 -file /tmp/lets-encrypt-x4-cross-signed.der

```
-Your java app should now be able to connect to an service using Let's Encrypt certificates.
