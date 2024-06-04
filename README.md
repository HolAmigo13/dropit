#Install k3s single node:
curl -sfL https://get.k3s.io | sh -


#Deploy front (React) and Backend (Express)
kubectl apply -f app/backend.yaml
kubectl apply -f fapp/frontend.yaml
kubectl expose deployment/express-rest-api-deployment --port=80 --target-port=5050
kubectl expose deployment/frontend-deployment --port=80 --target-port=3000

#Deploy Nginx
kubectl apply -f nginx/nginx-config-map.yaml
kubectl apply -f nginx/nginx-deployment.yaml
kubectl apply -f nginx/nginx-service.yaml

#Deploy Local MongoDB
kubectl apply -f mongo-db/mongo-db-pv.yaml
kubectl apply -f mongo-db/mongo-db-pvc.yaml
kubectl apply -f mongo-db/mongo-db-deployment.yaml
kubectl apply -f mongo-db/mongo-db-svc.yaml

#Create PV and PVC for csv backup
kubectl apply -f db-dump/pv-dump-store.yaml
kubectl apply -f db-dump/pvc-dump-store.yaml


#Important notes:
*The React app runs on the browser means, if you want to configure the service name in "app/config.js" (to avoid re-configuring the node IP with each deployment) add the service name in /etc/hosts.


