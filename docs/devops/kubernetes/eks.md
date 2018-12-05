title: EKS

## Annotations

### Load balancer

Load balancer service annotations for SSL

```yaml
service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "ssl-arn"
service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: '3600'
service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"
service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "https"
```

For network load balancer use

```yaml
service.beta.kubernetes.io/aws-load-balancer-type: nlb
```

For internal load blanacer use

```yaml
service.beta.kubernetes.io/aws-load-balancer-internal: 0.0.0.0/0
```


