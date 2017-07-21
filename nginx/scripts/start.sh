#!/bin/bash

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"

echo "--- Making SSL Directory ---"
mkdir -p "$SSL_DIR"

echo "--- Turning SSL on in nginx.conf. ---"
sed -i "/sendfile on;/a \\        ssl on;" /etc/nginx/nginx.conf


