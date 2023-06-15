server {
        listen 80;
        server_name blog.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://localhost:90;
                include proxy_params;
        }

}

server {
        listen 443 ssl;
        server_name blog.madhukarreddy.com;
        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com-0001/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com-0001/privkey.pem;

        location / {
                proxy_pass http://localhost:90;
                include proxy_params;
        }
}