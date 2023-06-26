
server {
        listen 98 ssl;
        server_name meta.madhukarreddy.com;
        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com-0001/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com-0001/privkey.pem;

        location / {
                proxy_pass http://localhost:98;
		include proxy_params;
        }
}
