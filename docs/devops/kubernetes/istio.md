# Istio

## Istio sidecar


```bash
# Enable auto injection on namespace
kubectl label namespace validation istio-injection=enabled
# Disable
kubectl label namespace validation istio-injection=disabled --overwrite
```

## Istio annotations

Should be added to the pod spec template

```yaml
# Disable sidecar
sidecar.istio.io/inject: "false"
# Disable egress traffic capture
traffic.sidecar.istio.io/excludeOutboundIPRanges: "0.0.0.0/0"
```

## Istio grafana dashboard

[Official repository](https://github.com/istio/istio/tree/master/install/kubernetes/helm/subcharts/grafana/dashboards)

## Istio command line

```bash
istioctl proxy-status
istioctl -n [env] proxy-config (clusters|listeners|routes|endpoints|bootstrap) [pod]
istioctl -n [env] get virtualservices
```

