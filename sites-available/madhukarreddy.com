
server {
        listen 80 default_server;
        server_name madhukarreddy.com www.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://localhost;
                include proxy_params;
        }
}

server {
        listen 443 ssl;
        server_name madhukarreddy.com www.madhukarreddy.com;

        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
		ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                root /var/www/html;
		index index.html index.htm;
        }
}
