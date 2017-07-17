#!/bin/sh

# Config for SSL.
echo "--- Making SSL Directory ---"
mkdir /etc/nginx/ssl

echo "--- Copying $i SSL crt and key ---"
openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=www.example.com"

echo "--- Turning SSL on in nginx.conf. ---"
# Comment out this line if you prefer ssl on a per
# server basis, rather for all sites on the vm.
# If commented out you can access hosts on http
# port 8000, and https port 44300. If uncommented,
# you can ONLY access hosts via https on port 44300.
sed -i "/sendfile on;/a \\        ssl on;" /etc/nginx/nginx.conf

conf_files="/etc/nginx/sites-available/*"
for file in $conf_files
do
  echo "--- Inserting SSL directives into site's server file. ---"
  sed -i "/listen 80;/a \\\n    listen 443 ssl;\n    ssl_certificate /etc/nginx/ssl/server.crt;\n    ssl_certificate_key /etc/nginx/ssl/server.key;\n\n" $file

done

echo "--- Restarting Serivces ---"
service nginx restart
service php5-fpm restart
