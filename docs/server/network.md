## Interfaces

**How to restart ?**

First **check** the file syntax using `sudo ifup --no-act br0`.

Then safely restart with `sudo ifdown br0 && sudo ifup br0`

## Listen incoming request

```bash
sudo stdbuf -oL -eL /usr/sbin/tcpdump -A -s 10240 "tcp port 4080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)" | egrep -a --line-buffered ".+(GET |HTTP\/|POST )|^[A-Za-z0-9-]+: " | perl -nle 'BEGIN{$|=1} { s/.*?(GET |HTTP\/[0-9.]* |POST )/\n$1/g; print }'
```

## Ports

**Check open ports on remove host**

```bash
nc -zv website  80
```

## IPs

Check public IP

```bash
curl ipinfo.io/ip
```
