# kamus

## Install

```
$ helm repo add soluto https://charts.soluto.io
$ npm install -g @soluto-asurion/kamus-cli
$ helm upgrade --install kamus soluto/kamus
```

## Usage

Encrypts the string `super-secret` .

```
$ export POD_NAME=(kubectl get pods --namespace default -l "app=kamus,release=kamus,component=encryptor" -o jsonpath="{.items[0].metadata.name}")
$ kubectl port-forward $POD_NAME 12345:9999
$ kamus-cli encrypt \
    --secret super-secret \
    --service-account kamus-sa \
    --namespace default \
    --kamus-url http://localhost:12345 --allow-insecure-url
[info  kamus-cli]: Encryption started...
[info  kamus-cli]: service account: kamus-sa
[info  kamus-cli]: namespace: default
[warn  kamus-cli]: Auth options were not provided, will try to encrypt without authentication to kamus
[info  kamus-cli]: Successfully encrypted data to kamus-sa service account in default namespace
[info  kamus-cli]: Encrypted data:
A0VrZdae6LQD+yOeXtBPhw==:Ge7M4yTZtaynIrmPtRhUng==
```

Change token in `configmap.yml` .  

```
$ kubectl get pods
NAME                                READY   STATUS            RESTARTS   AGE
kamus-controller-679c7647c6-xtqvp   1/1     Running           0          115s
kamus-decryptor-7c4c6447b5-28zz9    1/1     Running           0          101s
kamus-decryptor-7c4c6447b5-5rmnt    1/1     Running           0          115s
kamus-encryptor-98c6669c5-6hdd2     1/1     Running           0          115s
kamus-encryptor-98c6669c5-jzw4g     1/1     Running           0          100s
```

I'm ready. Let's deploy application.

```
$ kubectl apply -f serviceaccount.yml
$ kubectl apply -f configmap.yml
$ kubectl apply -f deployment.yml 
```

`/secrets/config.json` has plain token.

```
$ kubectl exec -it kamus-sample-app-5f8f4b7df9-mb6nm sh
/ # ls /secrets/
config.json
/ # cat /secrets/config.json
{
    "token":"super-secret"
}
```

`encrypted-secrets` configmap as it is encrypted.

```
$ kubectl get configmap encrypted-secrets -o yaml
apiVersion: v1
data:
  token: ctxOYCcBhJY3ldvX8a16wA==:36mZddDCKj5/dvtm/HrCgw==
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"token":"ctxOYCcBhJY3ldvX8a16wA==:36mZddDCKj5/dvtm/HrCgw=="},"kind":"ConfigMap","metadata":{"annotations":{},"name":"encrypted-secrets","namespace":"default"}}
  creationTimestamp: "2020-01-21T09:58:54Z"
  name: encrypted-secrets
  namespace: default
  resourceVersion: "2406819"
  selfLink: /api/v1/namespaces/default/configmaps/encrypted-secrets
  uid: a22ebfdf-3c34-11ea-854e-42010a8c011f
```
