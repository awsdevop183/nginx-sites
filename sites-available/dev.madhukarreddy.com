server {
        listen 80;
        server_name dev.madhukarreddy.com;

	location / {
                proxy_pass http://localhost:82;
		include proxy_params;
        }
	
}

server {
        listen 443 ssl;
        server_name dev.madhukarreddy.com;
        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                proxy_pass http://localhost:82;
		include proxy_params;
        }
}
