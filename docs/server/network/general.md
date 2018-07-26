## Interfaces

**How to restart ?**

First **check** the file syntax using `sudo ifup --no-act br0`.

Then safely restart with `sudo ifdown br0 && sudo ifup br0`

## Monitor input/output in real time

```bash
sudo iftop
```

## IPs

IP address show

```bash
ip a s
```

IP route show

```bash
ip route s
```

## Interfaces

Bring interface up (Ubuntu 18, NetPlan)

```
sudo ip link set ens4 up
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
