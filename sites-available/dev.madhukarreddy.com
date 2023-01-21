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
        ssl_certificate /etc/nginx/ssl/dev.madhukarreddy.com/certificate.crt;
        ssl_certificate_key /etc/nginx/ssl/dev.madhukarreddy.com/private.key;

        location / {
                proxy_pass http://localhost:82;
		include proxy_params;
        }
}
