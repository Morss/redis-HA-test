sentinels=`kubectl get pods | grep redis | grep sentinel | awk '{ print $1 }'`
while read -r sentinel; do
    echo "myipd: `kubectl exec $sentinel cat /etc/hosts | tail -n 1 | awk '{ print  }'`"
    kubectl exec $sentinel -- redis-cli -p 26379 SENTINEL masters
    echo
done <<< "$sentinels"
