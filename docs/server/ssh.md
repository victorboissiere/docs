## Proxy

Set up an [ssh bastion proxy](https://blog.scottlowe.org/2015/11/21/using-ssh-bastion-host/)

## Tunnel

```bash
ssh -L 3899:localhost:389 vboissiere@server
```

*Vagrant tunnel*

```bash
vg ssh -- -R 3899:localhost:3899
```
