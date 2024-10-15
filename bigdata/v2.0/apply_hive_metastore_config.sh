kubectl apply -f 0_hadoop-config.yaml 
kubectl apply -f 1_hive-config.yaml  
kubectl delete pod/datanode-nodemanager-0 -n bigdata
kubectl delete pod/namenode-resourcemanager-0 -n bigdata
kubectl delete pod/metastore-0 -n bigdata
kubectl delete pod/hive-0 -n bigdata

