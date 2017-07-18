#!/etc/nginx/sh

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"

echo "--- Making SSL Directory ---"
mkdir -p "$SSL_DIR"

echo "--- Turning SSL on in nginx.conf. ---"
sed -i "/sendfile on;/a \\        ssl on;" /etc/nginx/nginx.conf

conf_files="/etc/nginx/sites-available/*"
for i in $conf_files
do
    file=${i##*/}
    echo "--- Copying $file SSL crt and key ---"
    
    DOMAIN=$i

    openssl req -nodes -new -x509 -keyout /etc/nginx/ssl/"$file".key -out /etc/nginx/ssl/"$file".crt -subj "/C=US/ST=NY/L=NYC/O=Dis/CN=$file"

    echo "--- Inserting SSL directives into site's server file. ---"
    sed -i "/listen 80;/a \\\n    listen 443 ssl;\n    ssl_certificate /etc/nginx/ssl/$file.crt;\n    ssl_certificate_key /etc/nginx/ssl/$file.key;\n\n" /etc/nginx/sites-available/$file
done

echo "--- Restarting Serivces ---"
service nginx restart
