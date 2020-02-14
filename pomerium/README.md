# Pomerium

## Install

- Replace `[REPLACEME]` to your client_id and client_secret in `config/pomerium-configmap.yml` .
- Replace `your-domain.com` to your domain in `config/pomerium-configmap.yml` and `ingress.yml`
- Replace `your-global-static-ip-name` to your global static ip name in `ingress.yml`

```shell
$ env DOMAIN="*.your-domain.com" ./setup.sh 
```

## References

- https://www.pomerium.io/docs/quick-start/kubernetes.html
