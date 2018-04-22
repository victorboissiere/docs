## Yaml files

Kubernetes examples

Check out [all in one guestbook](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml)

## Deployment

CI Example for deployment

```bash
kubectl set image deployment/image-dashboard image-dashboard=gitcommit/k8s-image-dashboard:v1.0.4
# Check deployment success
kubectl rollout status deployment/image-dashboard
```

By default Kubernetes sets the `spec.progressDeadlineSeconds` to 600 seconds so you may want to change it.
