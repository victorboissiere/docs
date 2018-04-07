## Dynamic proxy

This could be used for load balancers as the IP address can change (i.e AWS).
This force Nginx to make the IP resolution at each request instead of at runtime.

```nginx
set $dynamic "http://mycustomserver";
location /api/ {
  proxy_pass $dynamic;
  proxy_set_header Host myhost;
  proxy_next_upstream error;
}
```

