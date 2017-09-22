sentinels=`kubectl get pods | grep redis-sentinel | awk '{ print $1 }'`
while read -r sentinel; do
    kubectl delete pod $sentinel
    sleep 10
done <<< "$sentinels"

sentinels=`kubectl get pods | grep redis-sentinel | awk '{ print $1 }'`
while read -r sentinel; do
    kubectl exec $sentinel -- redis-cli -p 26379 SENTINEL SET mymaster failover-timeout 3000
    kubectl exec $sentinel -- redis-cli -p 26379 SENTINEL SET mymaster down-after-milliseconds 2000
done <<< "$sentinels"
