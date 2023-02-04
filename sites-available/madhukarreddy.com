server {
        listen 80;
        server_name madhukarreddy.com;
        return 301 https://$server_name$request_uri;
}

server {
        listen 443 ssl;
        server_name madhukarreddy.com;

        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
		ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                root /var/www/html;
		index index.html index.htm;
        }
}
