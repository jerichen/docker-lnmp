#!/bin/bash

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"

echo "--- Making SSL Directory ---"
mkdir -p "$SSL_DIR"

# does not exist 80.443 port config
echo "--- Copying $file SSL crt and key ---"
openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=NGINX"

