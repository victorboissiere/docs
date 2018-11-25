## Nginx ingress controller

Main annotations

```yaml
nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: basic-auth
    nginx.ingress.kubernetes.io/auth-realm: "Authentication required"
    nginx.ingress.kubernetes.io/configuration-snippet: |-
      satisfy any;
      allow xx.xx.xx.xx;
      deny all;
```
