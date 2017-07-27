#!/bin/bash

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"
site=$1

echo "--- Making SSL Directory ---"
mkdir -p "$SSL_DIR"

echo "--- Turning SSL on in nginx.conf. ---"
sed -i "/sendfile on;/a \\        ssl on;" /etc/nginx/nginx.conf

if [ -z $site ]; then
# does not exist 80.443 port config
    echo "--- Copying $file SSL crt and key ---"
    openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/"$site".key -out /etc/nginx/ssl/"$site".crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=$site"

    echo "--- Inserting SSL directives into site's server file. ---"
    cp /etc/nginx/sites-available/default.conf /etc/nginx/sites-available/$site.conf
    sed -i "s/localhost/dev.$site/g" /etc/nginx/sites-available/$site.conf
    sed -i "s/\var/\www/\html/var/\www/\html/\$site/\public" /etc/nginx/sites-available/$site.conf
    sed -i "/listen [::]:80;/a \\\n   ssl_certificate /etc/nginx/ssl/$site.crt;\n    ssl_certificate_key /etc/nginx/ssl/$site.key;\n\n"  /etc/nginx/sites-available/$site.conf

    cp /etc/nginx/sites-available/default_ssl.conf /etc/nginx/sites-available/$site_ssl.conf
    sed -i "s/localhost/dev.$site/g" /etc/nginx/sites-available/$site_ssl.conf
    sed -i "s/\var/\www/\html/var/\www/\html/\$site/\public" /etc/nginx/sites-available/$site_ssl.conf
    sed -i "/listen [::]:443;/a \\\n   ssl_certificate /etc/nginx/ssl/$site.crt;\n    ssl_certificate_key /etc/nginx/ssl/$site.key;\n\n"  /etc/nginx/sites-available/$site_ssl.conf
else
# does exist 80.443 port config
    echo "--- error ---"
fi

