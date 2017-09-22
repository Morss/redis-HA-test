redisses=`kubectl get pods | grep redis | grep -v sentinel | awk '{ print $1 }'`

while read -r redis; do
    echo "myipd: `kubectl exec $redis cat /etc/hosts | tail -n 1 | awk '{ print  }'`"
    kubectl exec $redis redis-cli ROLE
    echo
done <<< "$redisses"
