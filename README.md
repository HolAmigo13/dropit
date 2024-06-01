#Install k3s single node
curl -sfL https://get.k3s.io | sh -

kubectl apply -f backend.yaml
kubectl apply -f frontend.yaml
kubectl expose pod mongodb-express-rest-api-pod  --port=80 --target-port=5050
kubectl expose pod frontend-pod --port=80 --target-port=3000 //--type=NodePort

curl http://mongodb-express-rest-api-pod.default.svc.cluster.local/posts/latest
db.posts.count()
