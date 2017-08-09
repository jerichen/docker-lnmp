#!/bin/bash

# Config for SSL.
site=$1

# change role
RUN chmod -R guo+w /usr/local/bin/run-ssl.sh  /var/www/html/"$site"/storage

if ! [ -z $site ]; then
# does not exist 80.443 port config
    echo "--- Copying $file SSL crt and key ---"
    openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/"$site".key -out /etc/nginx/ssl/"$site".crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=$site"

    echo "--- Inserting SSL directives into site's server file. ---"
    cp /etc/nginx/sites-available/default.conf /etc/nginx/sites-available/"$site".conf
    sed -i "s/localhost/dev.$site/g" /etc/nginx/sites-available/"$site".conf
    sed -i "s/var\/www\/html/var\/www\/html\/$site\/public/g" /etc/nginx/sites-available/"$site".conf
    sed -i "s/default.crt/$site.crt/g" /etc/nginx/sites-available/"$site".conf
    sed -i "s/default.key/$site.key/g" /etc/nginx/sites-available/"$site".conf
else
# does exist 80.443 port config
    echo "--- run-ssl error ---"
fi

