## Yaml files

Kubernetes examples

Check out [all in one guestbook](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml)

## Deployment

CI Example for deployment

```bash
kubectl set image deployment/image-dashboard image-dashboard=gitcommit/k8s-image-dashboard:v1.0.4 --record
# Check deployment success
kubectl rollout status deployment/image-dashboard
```

By default Kubernetes sets the `spec.progressDeadlineSeconds` to 600 seconds so you may want to change it.

List **rollout history**:

```bash
kubectl rollout history deployment/image-dashboard
# Details
kubectl rollout history deployment/image-dashboard --revision=2
```

**Revert** to a previous version:

```bash
kubectl rollout undo deployment/image-dashboard --to-revision=2
```


