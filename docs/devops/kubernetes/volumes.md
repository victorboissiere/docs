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

```yml
volumes:
- name: elasticsearch-logging
	persistentvolumeclaim:
	claimname: dev-elasticsearch
```

```yml
volumeMounts:
	- name: elasticsearch-logging
		moutnPath: /data
```

**Stateful set** with volume claim templates

```yml
volumeClaimTemplates:
    - metadata:
        name: elasticsearch-logging
      spec:
        accessModes: ["ReadWriteOnce"]
        resources:
          requests:
            storage: 80Gi
```

## Use a backup volume

```yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: {{name}}
  namespace: default
spec:
  storageClassName: gp2
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 100Gi
  awsElasticBlockStore:
    fsType: ext4
    volumeID: aws://{{ region }}/{{ vol-id }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ name }}
  namespace: default
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 100Gi
  storageClassName: gp2
  volumeName: {{ vol-name }}
```
