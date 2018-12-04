title: GKE

## GKE service account

``` bash
kubectl create clusterrolebinding USER_XXXX-cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=USER_XXXX@XX.com
```

## Docker secret for container registry

``` bash
kubectl create secret docker-registry SECRET_NAME \
  --docker-server=https://eu.gcr.io \
  --docker-username=_json_key \
  --docker-email=XX@XXX \
  --docker-password="$(cat token.json)"
```

For local use only

``` bash
 docker login -u _json_key -p "$(cat service_account_key.json)" https://eu.gcr.io
```

Change `credsStore` value to empty string to use plain text registry.

You can also use different credHelpers (recommended).

``` json
{
   "credHelpers": {
            "coolregistry.com": ... ,
            "gcr.io": "gcr",
            "asia.gcr.io": "gcr",
            ...
      }
}
```

## Annotations and custom configuration

### Ingress Load balancer

```yaml
kubernetes.io/ingress.class: "gce"
kubernetes.io/ingress.global-static-ip-name: "global-ip-name"
ingress.kubernetes.io/ssl-cert: "cert1,cert2"
```

In order to generate SSL managed certificates, use gcloud command:

```sh
gcloud beta compute ssl-certificates create [SSL_CERTIFICATE_NAME] \
    --domains [DOMAIN]
gcloud beta compute ssl-certificates list
```

### Cloud Armor policy

Create binding backend configuration

```yaml
apiVersion: cloud.google.com/v1beta1
kind: BackendConfig
metadata:
  name: backend-config
  namespace: ingress
spec:
  securityPolicy:
   name: "cloud-armor-policy-name"
```

Bind service to cloud armor policy

```yaml
beta.cloud.google.com/backend-config: '{"ports": {"80":"backend-config"}}'
```

