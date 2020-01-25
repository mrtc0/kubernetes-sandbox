# Kubernetes Sandbox

This repository is for my kubernetes training sandbox.

## Launch

```
$ gcloud container clusters resize $CLUSTER_NAME --size=3 --region=$CLUSTER_REGION
```

## Shutdown

```
$ gcloud container clusters resize $CLUSTER_NAME --size=0 --region=$CLUSTER_REGION
```

## Add-ons

Referer to the README.md of each directory for how to build each add-ons.

- ELK Stack
- Falco
- Helm
- Prometheus
- Grafana
- kamus
- Wazuh
