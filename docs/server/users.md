## Add user to sudo group

`sudo usermod -aG sudo username`

## Sudo permissions only for some commands

Just replace `host` with your hostname and `nginx` with your username in `/etc/sudoers`.

```bash
Cmnd_Alias WEB = /bin/systemctl * nginx
nginx host=NOPASSWD: WEB
```

