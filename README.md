# k8s
#1.minikube
minikube start --memory=32768 --cpus=4 --disk-size=100g
#2.istio (istio-system)
istioctl install  
#3. tạo các namespace
kubectl create namespace cert-manager
kubectl create namespace keycloak
kubectl create namespace pulsar
kubectl create namespace infinispan
kubectl create namespace citus
kubectl create namespace microservices
kubectl create namespace redis
kubectl create namespace superset
kubectl create namespace bigdata


#4. tạo các serviceaccount
kubectl create serviceaccount cert-manager-controller -n cert-manager
kubectl create serviceaccount keycloak-admin -n keycloak
kubectl create serviceaccount pulsar-admin -n pulsar
kubectl create serviceaccount infinispan-user -n infinispan
kubectl create serviceaccount citus-user -n citus
kubectl create serviceaccount microservice-gateway -n microservices
kubectl create serviceaccount microservice-account -n microservices
#5. tạo các rolebinding
kubectl create rolebinding cert-manager-binding --clusterrole=admin --serviceaccount=cert-manager:cert-manager-controller -n cert-manager
kubectl create rolebinding keycloak-admin-binding --clusterrole=admin --serviceaccount=keycloak:keycloak-admin -n keycloak
kubectl create rolebinding pulsar-admin-binding --clusterrole=admin --serviceaccount=pulsar:pulsar-admin -n pulsar
kubectl create rolebinding infinispan-user-binding --clusterrole=edit --serviceaccount=infinispan:infinispan-user -n infinispan
kubectl create rolebinding citus-user-binding --clusterrole=edit --serviceaccount=citus:citus-user -n citus
kubectl create rolebinding microservice-gateway-binding --clusterrole=admin --serviceaccount=microservices:microservice-gateway -n microservices
kubectl create rolebinding microservice-account-binding --clusterrole=admin --serviceaccount=microservices:microservice-account -n microservices

#6 citus
kubectl apply -f citus/secrets.yaml 
kubectl patch serviceaccount citus-user -n citus -p '{"secrets": [{"name": "citus-secrets"}]}'
kubectl exec -it citus-master-0 -n citus -- bash
-- master, all worker
psql -U postgres
CREATE USER smartconsultor WITH PASSWORD 'secret99';
ALTER USER smartconsultor SUPERUSER;
ALTER USER smartconsultor CREATEDB CREATEROLE;
CREATE DATABASE smartconsultor;
CREATE DATABASE superset;
CREATE DATABASE keycloak;

-- master, all worker
psql -U smartconsultor -d smartconsultor
CREATE SCHEMA standing;
CREATE SCHEMA history;
CREATE EXTENSION citus;

psql -U smartconsultor -d superset
CREATE EXTENSION citus;

--master 
psql -U smartconsultor -d smartconsultor
SELECT citus_set_coordinator_host('citus-master-0', 5432);
SELECT * from citus_add_node('citus-worker-0.citus-workers', 5432);
SELECT * from citus_add_node('citus-worker-1.citus-workers', 5432);
SELECT * FROM citus_get_active_worker_nodes();
ALTER SYSTEM SET citus.shard_replication_factor TO 2;
SELECT pg_reload_conf();

#7 keycloak
cd ~/SmartConsultor/microservices/k8s 
kubectl apply -f 0_cert.yaml 
base64_data=$(kubectl get secret smartconsultor-certificate-tls -n istio-system -o jsonpath="{.data['ca\.crt']}")
echo $base64_data | base64 --decode > ca.crt
helm install keycloak .\keycloak --namespace istio-system
sudo nano /etc/hosts #127.0.0.1 auth.smartconsultor.com
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder

#8 infinispan
helm install infinispan ./infinispan --namespace infinispan
#9 microservices
sudo kubectl port-forward svc/keycloak 443:443 -n keycloak  --address 192.168.220.190
sudo minikube tunnel

#10 pulsar
-- citus for pulsar
kubectl exec -it citus-master-0 -n citus -- psql -U smartconsultor -d smartconsultor -f - < ./k8s/pulsar/postgresql-schema.sql
-- install pulsar
helm repo add apache https://pulsar.apache.org/charts
helm search repo pulsar
helm repo update
helm pull apache/pulsar --version 3.5.0
helm install  pulsar ./pulsar --namespace pulsar
helm upgrade pulsar ./pulsar --namespace pulsar

#11 redis
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo bitnami/redis
helm pull bitnami/redis
helm install redis ./redis --namespace redis

#12 superset
helm repo add superset https://apache.github.io/superset
helm repo update
helm search repo superset/superset
helm pull superset/superset --version 0.12.11 
helm install superset ./superset --namespace superset

#13 hadoop hive-metastore hive
kubectl apply -f 0_hdfs-config.yaml
kubectl apply -f 2_hdfs-namenode-deployment.yaml  
kubectl apply -f 3_hdfs-namenode-service.yaml
kubectl apply -f 4_hdfs-datanode-deployment.yaml  
kubectl apply -f 5_hdfs-datanode-service.yaml
  


