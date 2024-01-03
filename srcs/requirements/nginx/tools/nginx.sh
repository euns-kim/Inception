#!/bin/bash

# Generate a self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /path/to/private.key -out /path/to/certificate.crt

# Configure nginx to use the certificate
sed -i 's/#ssl_certificate/ssl_certificate/g' /etc/nginx/nginx.conf
sed -i 's/#ssl_certificate_key/ssl_certificate_key/g' /etc/nginx/nginx.conf
sed -i 's|/path/to/certificate.crt|/path/to/certificate.crt|g' /etc/nginx/nginx.conf
sed -i 's|/path/to/private.key|/path/to/private.key|g' /etc/nginx/nginx.conf

# Start nginx
service nginx start


