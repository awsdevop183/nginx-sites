server {
        listen 80;
        server_name cpu.madhukarreddy.com;

	location / {
                proxy_pass http://localhost:6000;
		include proxy_params;
        }
	
}

server {
        listen 443 ssl;
        server_name cpu.madhukarreddy.com;
        ssl_certificate /etc/letsencrypt/live/madhukarreddy.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/madhukarreddy.com/privkey.pem;

        location / {
                proxy_pass http://localhost:6000;
		include proxy_params;
        }
}
