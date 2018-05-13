## Interfaces

**How to restart ?**

First **check** the file syntax using `sudo ifup --no-act br0`.

Then safely restart with `sudo ifdown br0 && sudo ifup br0`

## IPs

IP address show

```bash
ip a s
```

IP route show

```bash
ip route s
```

## IPTables

List all chains and policies with `iptables -L -n`

Default table: `filter`.

- `-t [table]`: Append
- `-A [chain]`: Append
- `-S [chain]`: List rules
- `-I [chain] [position]`: Insert rule to specific location (default pos 1)
- `-P [chain] [target]`: Change policy (here target: ACCEPT,DROP)
- `-D [rule_position]`: Delete (`iptables -L -n --line-numbers`)
- `-R [rule_position]`: Replace
- `-i [input_inteface]`
- `-o [input_inteface]`
- `-j [target]`: Jump to target
- `-p [protocol]`
- `--dport [port]`

Default rules and policies are located in `/etc/iptables/iptables.rules`.

![IPTables FlowChart](img/iptables-flowchart.jpg)

### Examples

**Update default policy**

```bash
iptables -P INPUT DROP
```

**Source nat**

```bash
/sbin/iptables -t nat -I POSTROUTING -s 10.8.0.0/24 -d 172.31.0.0/16 -j SNAT --to-source 172.32.0.10
```

**List rules**

```bash
sudo iptables -t nat -S POSTROUTING
```

**Masquerade with OpenVPN** *tap0*

```bash
/sbin/iptables -t nat -A POSTROUTING -o tap0 -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o tap0 -j ACCEPT
/sbin/iptables -A FORWARD -i tap0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
```

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
curl ip.gitcommit.fr
```
