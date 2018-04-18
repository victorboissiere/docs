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

**Stateful set** with volume claim templates

```yaml
volumeClaimTemplates:
    - metadata:
        name: elasticsearch-logging
      spec:
        accessModes: ["ReadWriteOnce"]
        resources:
          requests:
            storage: 80Gi
```
