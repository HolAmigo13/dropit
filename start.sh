#!/bin/bash

curl -sfL https://get.k3s.io | sh -
kubectl apply -f app/backend.yaml
kubectl apply -f fapp/frontend.yaml
kubectl expose deployment/express-rest-api-deployment --port=80 --target-port=5050
kubectl expose deployment/frontend-deployment --port=80 --target-port=3000
kubectl apply -f nginx/nginx-config-map.yaml
kubectl apply -f nginx/nginx-deployment.yaml
kubectl apply -f nginx/nginx-service.yaml
kubectl apply -f mongo-db/mongo-db-pv.yaml
kubectl apply -f mongo-db/mongo-db-pvc.yaml
kubectl apply -f mongo-db/mongo-db-deployment.yaml
kubectl apply -f mongo-db/mongo-db-svc.yaml
kubectl apply -f db-dump/pv-dump-store.yaml
kubectl apply -f db-dump/pvc-dump-store.yaml