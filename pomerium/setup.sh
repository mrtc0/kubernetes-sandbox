#!/bin/bash

# export DOMAIN="*.corp.beyondperimeter.com"

kubectl apply -f config/pomerium-configmap.yml

kubectl create secret generic shared-secret --from-literal=shared-secret=$(head -c32 /dev/urandom | base64)
kubectl create secret generic cookie-secret --from-literal=cookie-secret=$(head -c32 /dev/urandom | base64)

kubectl create secret generic certificate \
	--from-literal=certificate=$(base64 -i "$HOME/.acme.sh/{$DOMAIN}_ecc/fullchain.cer")
kubectl create secret generic certificate-key \
	--from-literal=certificate-key=$(base64 -i "$HOME/.acme.sh/{$DOMAIN}_ecc/{$DOMAIN}.key")

kubectl create secret tls pomerium-tls \
	--key "$HOME/.acme.sh/{$DOMAIN}_ecc/{$DOMAIN}.key" \
	--cert "$HOME/.acme.sh/{$DOMAIN}_ecc/fullchain.cer"

kubectl apply -f pomerium-proxy.yml
kubectl apply -f pomerium-authenticate.yml
kubectl apply -f pomerium-authorize.yml
kubectl apply -f pomerium-cache.yml
kubectl apply -f httpbin.yml
kubectl apply -f ingress.yml
