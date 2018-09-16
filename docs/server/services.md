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

- dns `#!bash dnsmasq --test`
- haproxy `#!bash haproxy -c -V -f /etc/haproxy/haproxy.cfg`
- lorotate `#!bash sudo logrotate -d /etc/logrotate.d/myfile`
- nginx `#!bash sudo service nginx configtest`

## Create service

Simple service (daemon managed by systemd).

```bash
[Unit]
Description=Example service
After=syslog.target

[Service]
Type=simple
User=web
Group=web
WorkingDirectory=/home/web/
ExecStart=echo service
Restart=always
RestartSec=10
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=gammu

[Install]
WantedBy=multi-user.target
```

Do not forget to run `sudo systemctl daemon-reload`.
