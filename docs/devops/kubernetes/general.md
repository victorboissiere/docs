## Kubernetes links

[K8S Cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

[API Spec](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#deployment-v1-apps)

## Debug

```bash
kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
```

## Add new user

Kubernetes does not allow to create user by itself but via certificates.

Generate a new certificate and add it to k8s.

```bash
openssl genrsa -out user1.pem 2048
openssl req -new -key user1.pem -out user1.csr -subj "/CN=user1"
cat <<EOF | kubectl create -f -
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: user1
spec:
  groups:
  - system:authenticated
  request: $(cat user1-csr.csr | base64 | tr -d '\n')
  usages:
  - digital signature
  - key encipherment
  - client auth
EOF
```
Then approve the certificate
```bash
kubectl certificate approve user1
```

Now the certificate should be signed. You can download the new public key from the csr resource.

```bash
kubectl get csr user1 -o jsonpath='{.status.certificate}' | base64 -d > user1.crt
```

Then you can generate the new context file

```bash
kubectl --kubeconfig ~/.kube/config config set-cluster user1 --insecure-skip-tls-verify=true --server=https://api.my-cluster.dev
kubectl --kubeconfig ~/.kube/config config set-credentials user1 --client-certificate=user1.crt --client-key=user1.pem --embed-certs=true
kubectl --kubeconfig ~/.kube/config config set-context user1 --cluster=user1 --user=user1
kubectl --kubeconfig ~/.kube/config config use-context user1
```

With **rbac enabled** this user will not have any permissions.
You have to add appropriate rbac rules manually.
