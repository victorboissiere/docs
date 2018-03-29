## Config

Config example

```bash
Host github.com
HostName github.com
User git
IdentityFile ~/.ssh/github_rsa
AddKeysToAgent yes
```

## SSH-agent

Small [project](https://github.com/victorboissiere/ssh-agent-setup) to help to persist and handle ssh-agent on each ssh login


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
