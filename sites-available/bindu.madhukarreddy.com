server {
        listen 80;
        server_name bindu.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://localhost:9091;
                include proxy_params;
        }

}

server {
        listen 443 ssl;
        server_name bindu.madhukarreddy.com;
        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                proxy_pass http://localhost:9091;
                include proxy_params;
        }
}