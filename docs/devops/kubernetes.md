## Yaml files

Check out [all in one guestbook](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml)

## Volumes

Persistent Volume Claim

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: dev-elasticsearch
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Gi
```

**Usage**

```yaml
volumes:
- name: elasticsearch-logging
	persistentvolumeclaim:
	claimname: dev-elasticsearch
```

```yaml
volumeMounts:
	- name: elasticsearch-logging
		moutnPath: /data
```
