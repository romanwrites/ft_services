# export MINIKUBE_HOME="$HOME/goinfre/.minikube"
# export PATH="$MINIKUBE_HOME/bin:$PATH"
# export KUBECONFIG="$MINIKUBE_HOME/.kube/config"
# export MINIKUBE_ACTIVE_DOCKERD=minikube
# export KUBE_EDITOR="code -w"
# export MACHINE_STORAGE_PATH=~/goinfre/mkristie/.docker

minikube start --vm-driver=virtualbox --disk-size="7000mb" --memory="3000mb"
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable metrics-server;
minikube addons enable dashboard;

kubectl apply -f srcs/metallb.yaml

docker build -t nginx-image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

docker build -t ftps-image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

docker build -t mariadb-image srcs/mysql
kubectl apply -f srcs/mysql/mariadb.yaml

docker build -t wordpress-image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

docker build -t phpmyadmin-image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t influxdb-image srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

docker build -t telegraf-image srcs/telegraf
kubectl apply -f srcs/telegraf/telegraf.yaml

docker build -t grafana-image srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml

minikube dashboard

# kubectl delete all --all
# kubectl delete pvc --all
# kubectl delete pv --all

# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/mariadb -- pkill /usr/bin/mysqld 
# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd

# kubectl exec -it deploy/ftps -- /bin/sh