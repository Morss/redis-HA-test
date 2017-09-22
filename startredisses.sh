kubectl delete -f .
sleep 10
kubectl create -f redis-master.yaml
sleep 10
kubectl create -f redis-sentinel-service.yaml
sleep 2
kubectl create -f redis-controller.yaml
sleep 2
kubectl create -f redis-sentinel-controller.yaml
sleep 2
kubectl scale rc redis --replicas=3
kubectl scale rc redis-sentinel --replicas=3
sleep 15
kubectl delete pods redis-master
