# Istio

## Sidecar


```yaml
# Enable auto injection on namespace
kubectl label namespace validation istio-injection=enabled
```

## Annotations

```yaml
traffic.sidecar.istio.io/excludeOutboundIPRanges: "0.0.0.0/0" # Do not capture any egress traffic
```

## Grafana dashboard

[Official repository](https://github.com/istio/istio/tree/master/install/kubernetes/helm/subcharts/grafana/dashboards)
