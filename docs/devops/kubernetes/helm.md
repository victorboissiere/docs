## Commands

```bash
 helm list
 helm repo (list|add|update)
 helm search
 helm inspect <chart-name>
 hem install --set a=b -f config.yaml <chart-name> -n <release-name>

 hem upgrade --set a=b -f config.yaml <release-name> <chart-name>
 hem upgrade --set a=b --reuse-values <release-name> <chart-name> # change only a var

 helm template <chart-name>
 helm template <chart-name> -x templates/deployment.yaml # render specific template

 helm status <deployment-name>
 helm delete <deployment-name>
 helm inspect values <chart-name>
 helm upgrade -f config.yaml <deployment-name> <chart-name>
 helm rollback <deployment-name> <version>

 helm create <chart-name>
 helm package <chart-name>
 helm lint <chart-name>

 helm dep up <chart-name> # update dependency
 helm get manifest <deployment-name> # prints out all of the Kubernetes resources that were uploaded to the server
 helm install --debug --dry-run <deployment-name> # it will return the rendered template to you so you can see the output
```

## Links

[CheatSheet](https://gist.github.com/tuannvm/4e1bcc993f683ee275ed36e67c30ac49)
