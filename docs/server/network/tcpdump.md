## Examples

```bash
# NETWORK INTERFACES
tcpdump -i eth0

# SRC/DEST
tcpdump src 1.2.3.4
tcpdump dst 1.2.3.4
tcpdump net 172.31.0.0/16
tcpdump dst net 172.31.0.0/16
tcpdump host 192.168.1.10 # src and dest

# PORT
tcpdump src port 22
tcpdump udp dst 1194
tcpdump portrange 21-22
```

## Listen incoming HTTP request on specific port

```bash
sudo stdbuf -oL -eL /usr/sbin/tcpdump -A -s 10240 "tcp port 4080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)" | egrep -a --line-buffered ".+(GET |HTTP\/|POST )|^[A-Za-z0-9-]+: " | perl -nle 'BEGIN{$|=1} { s/.*?(GET |HTTP\/[0-9.]* |POST )/\n$1/g; print }'
```
