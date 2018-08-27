## DNS

```
sudo certbot certonly --manual -d 'domain.fr' --preferred-challenges dns
# Override default name
sudo certbot certonly --manual --cert-name custom  -d 'domain.fr' --preferred-challenges dns
```
