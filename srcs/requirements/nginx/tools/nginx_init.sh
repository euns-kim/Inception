#!/bin/sh

# Generate a self-signed key and certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/eunskim-selfsigned.key \
-out /etc/ssl/certs/eunskim-selfsigned.crt \
 -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=student/CN=localhost"

nginx -g "daemon off;"
