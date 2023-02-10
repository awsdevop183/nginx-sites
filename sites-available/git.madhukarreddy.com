upstream madhu_git {
    server 10.1.3.179;
}


server {
        listen 80;
        server_name git.madhukarreddy.com;
        return 301 https://$server_name$request_uri;
        location / {
                proxy_pass http://madhu_git;
                include proxy_params;
        }
}

server {
        listen 443 ssl;
        server_name git.madhukarreddy.com;

        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
		ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                proxy_pass http://madhu_git;
                include proxy_params;
        }
}