
## Links

[Utiliy script project](https://github.com/Angristan/OpenVPN-install)

[Openvpn-config-splitter](https://github.com/rexxars/openvpn-config-splitter)

## Server Configuration

### Management

```
management localhost 5555
```

### Static clients

_server.conf_

```
client-config-dir /etc/openvpn/staticclient
```

_staticclient directory file example_

```
ifconfig-push 10.42.42.2 255.255.255.0
```


## Client Configuration

```
# Redirect all traffic
redirect-gateway def1
```
