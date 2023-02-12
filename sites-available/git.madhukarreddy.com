
server {
        listen 80;
        server_name git.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://localhost:8082;
                include proxy_params;
        }
}

server {
        listen 443 ssl;
        server_name git.madhukarreddy.com;

        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com-0002/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com-0002/privkey.pem;

        location / {
                proxy_pass http://localhost:8082;
                include proxy_params;
        }
}
