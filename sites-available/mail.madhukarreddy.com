server {
        listen 80;
        server_name mail.madhukarreddy.com www.mail.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://127.0.0.1:90;
                include proxy_params;
        }
}

server {
        listen 443 ssl;
        server_name mail.madhukarreddy.com www.mail.madhukarreddy.com;

        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
		index index.html index.htm;
        }
}
