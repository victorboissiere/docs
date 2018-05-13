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
