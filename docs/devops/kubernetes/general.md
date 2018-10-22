## Yaml files

[K8S Cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

[API Spec](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#deployment-v1-apps)

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

## Helm

Helm with [service account](https://github.com/helm/helm/blob/master/docs/rbac.md).

```bash
helm init --service-account tiller --upgrade
```
