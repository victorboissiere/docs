## Init

Helm with [service account](https://github.com/helm/helm/blob/master/docs/rbac.md).

```bash
helm init --service-account tiller --upgrade
```

## Commands

```bash
helm list
helm repo (list|add|update)
helm search
helm inspect <chart-name>
hem install --set a=b -f config.yaml <chart-name> -n <release-name>

hem upgrade --set a=b -f config.yaml <release-name> <chart-name>
# change only a var
hem upgrade --set a=b --reuse-values <release-name> <chart-name> 

helm template <chart-name>
# render specific template
helm template <chart-name> -x templates/deployment.yaml

helm status <deployment-name>
helm delete <deployment-name>
helm inspect values <chart-name>
helm upgrade -f config.yaml <deployment-name> <chart-name>
helm rollback <deployment-name> <version>

helm create <chart-name>
helm package <chart-name>
helm lint <chart-name>

# update dependency
helm dep up <chart-name>
# prints out all of the Kubernetes resources that were uploaded to the server
helm get manifest <deployment-name>
# it will return the rendered template to you so you can see the output
helm install --debug --dry-run <deployment-name>
```

## Links

[CheatSheet](https://gist.github.com/tuannvm/4e1bcc993f683ee275ed36e67c30ac49)
