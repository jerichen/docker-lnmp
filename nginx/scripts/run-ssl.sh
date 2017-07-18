#!/etc/nginx/sh

# Config for SSL.
SSL_DIR="/etc/nginx/ssl"
PASSPHRASE="secret"
SUBJ="
C=BE
ST=SomeState
O=SomeCompany
localityName=SomeCity
commonName=*.$DOMAIN
organizationalUnitName=HQ
emailAddress=some@email.com
"

echo "--- Making SSL Directory ---"
sudo mkdir -p "$SSL_DIR"

echo "--- Turning SSL on in nginx.conf. ---"
sed -i "/sendfile on;/a \\        ssl on;" /etc/nginx/nginx.conf

conf_files="/etc/nginx/sites-available/*"
for i in $conf_files
do
    file=${i##*/}
    echo "--- Copying $file SSL crt and key ---"
    
    DOMAIN=$i

    openssl genrsa -out "$SSL_DIR/$DOMAIN.key" 1024 >/dev/null 2>&amp;1
    openssl req -new -subj "$(echo -n "$SUBJ" | tr "\n" "/")" -key "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.csr" -passin pass:$PASSPHRASE >/dev/null 2>&amp;1
    openssl x509 -req -days 365 -in "$SSL_DIR/$DOMAIN.csr" -signkey "$SSL_DIR/$DOMAIN.key" -out "$SSL_DIR/$DOMAIN.crt" >/dev/null 2>&amp;1

    echo "--- Inserting SSL directives into site's server file. ---"
    sed -i "/listen 80;/a \\\n    listen 443 ssl;\n    ssl_certificate /etc/nginx/ssl/$file.crt;\n    ssl_certificate_key /etc/nginx/ssl/$file.key;\n\n" /etc/nginx/sites-available/$file
done

echo "--- Restarting Serivces ---"
service nginx restart
