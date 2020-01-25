# Wazuh

## Install

```
$ kubectl apply -f namespace.yml
$ kubectl apply -Rf elasticsearch/

$ kubectl apply -f kibana/kibana-deployment.yml
$ kubectl apply -f kibana/kibana-service.yml
# If you create nginx ingress, apply nginx deployment and service
# $ kubectl apply -f kibana/nginx-deployment.yml
# $ kubectl apply -f kibana/nginx-service.yml

$ kubectl apply -Rf wazuh-managers/
```

## Port-forward

```
$ kubectl port-forward $WAZUH_KIBANA_POD_NAME 5601
```
