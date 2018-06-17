
## Swap

Empty swap

```bash
sudo swapoff -a && sudo swapon -a
```

Modify swapiness or how often the swap should be used.

```bash
# Check
cat /proc/sys/vm/swappiness
# Set new value
sudo sysctl vm.swappiness=10
# Set new persistent value in /etc/sysctl.conf
vm.swappiness = 10
```

## Memory usage

List 10 processes that use the most memory

```bash
ps aux --sort=-%mem | awk 'NR<=10{print $0}'
```
