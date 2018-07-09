## Default config

User `nginx` on alpine and `www-data` on ubuntu.

```nginx
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
  worker_connections  1024;
}


http {
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;

  server_tokens off;
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    '$status $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';

  access_log  /var/log/nginx/access.log  main;
  sendfile        on;
  keepalive_timeout  65;

  include /etc/nginx/conf.d/*.conf;
}
```

## Dynamic proxy

This could be used for load balancers as the IP address can change (i.e AWS).
This force Nginx to make the IP resolution at each request instead of at runtime.
You should explicit the **resolver** used.

```nginx
resolver 1.1.1.1;
set $dynamic "http://mycustomserver";
location /api/ {
  proxy_pass $dynamic;
  proxy_set_header Host myhost;
  proxy_next_upstream error;
}
```

## Url rewrite

```nginx
location /url/ {
  rewrite  ^/url/(.*)$  /$1 break;
  proxy_pass http://localhost:80;
  proxy_set_header Host $host;
  proxy_next_upstream error;
}
```

## SSL

```nginx
listen 443 ssl http2;
listen [::]:443 ssl http2;

ssl_certificate /etc/letsencrypt/live/website.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/website.com/privkey.pem;
ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
ssl_session_timeout 1d;
ssl_session_cache shared:SSL:50m;
```

## Images

```nginx
location ~* \.(?:ico|css|js|gif|jpe?g|png)$ {
  expires max;
  add_header Pragma public;
  add_header Cache-Control "public, must-revalidate, proxy-revalidate";
}
```

## CORS

```nginx
add_header 'Access-Control-Allow-Origin' '*' always;
add_header 'Access-Control-Allow-Headers' 'Authorization,DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type' always;
add_header 'Access-Control-Allow-Methods' 'OPTIONS, POST, GET, PUT, PATCH, DELETE' always;
```

## Default return

```nginx
location / {
  add_header Content-Type text/plain;
  return 200 "ok";
}
```

