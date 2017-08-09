#!/bin/bash

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"
site=$1

echo "--- Making SSL Directory ---"
mkdir -p "$SSL_DIR"

if ! [ -z $site ]; then
# does not exist 80.443 port config
    echo "--- Copying $file SSL crt and key ---"
    openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/"$site".key -out /etc/nginx/ssl/"$site".crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=$site"

    echo "--- Inserting SSL directives into site's server file. ---"
    sed -i "/charset utf-8;/a \\\n   ssl_certificate /etc/nginx/ssl/$site.crt;\n   ssl_certificate_key /etc/nginx/ssl/$site.key;\n\n"  /etc/nginx/sites-available/"$site".conf
else
# does exist 80.443 port config
    echo "--- default error ---"
fi

