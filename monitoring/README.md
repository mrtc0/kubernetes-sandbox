# Monitoring

Monitoring cluster and pod using prometheus and grafana.

## Prometheus

### Install

```
# $ helm inspect values stable/prometheus > prometheus-values.yaml
$ helm install --name prometheus --namespace monitoring -f prometheus-values.yaml stable/prometheus
```

### Upgrade

```
$ helm upgrade -f prometheus-values.yaml prometheus stable/prometheus
```

## Grafana

### Install

```
# $ helm inspect values stable/grafana > grafana-values.yaml
$ helm install --name grafana --namespace monitoring -f grafana-values.yaml stable/grafana
```

### Upgrade

```
$ helm upgrade -f grafana-values.yaml grafana stable/grafana
```

### Port-forward

```
$ export POD_NAME=(kubectl get pods --namespace monitoring -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}")
# Get Password from secret, username is admin
$ kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode
$ kubectl port-forward $POD_NAME 3000
```
