## General

```bash
update-rc.d serviceName enable
```

```bash
service --status-all
```

**Find the path**

```bash
systemctl show -p FragmentPath pure-ftpd.service
```

**List services (enabled, static, masked)**

```bash
systemctl list-unit-files
```

## Service checks

- dns `dnsmasq --test`
- haproxy `haproxy -c -V -f /etc/haproxy/haproxy.cfg`
- lorotate `sudo logrotate -d /etc/logrotate.d/myfile`

## Create service

Simple service (daemon managed by systemd).

```
[Unit]
Description=Example service
After=syslog.target

[Service]
Type=simple
User=web
Group=web
WorkingDirectory=/home/web/
ExecStart=echo service
StandardOutput=syslog
StandardError=syslog

[Install]
WantedBy=multi-user.target
```

Do not forget to run `sudo systemctl daemon-reload`.
