# export MINIKUBE_HOME="$HOME/goinfre/.minikube"
# export PATH="$MINIKUBE_HOME/bin:$PATH"
# export KUBECONFIG="$MINIKUBE_HOME/.kube/config"
# export MINIKUBE_ACTIVE_DOCKERD=minikube
# export KUBE_EDITOR="code -w"
# export MACHINE_STORAGE_PATH=~/goinfre/mkristie/.docker

minikube start --vm-driver=virtualbox --disk-size="5000mb" --memory="3000mb"
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable metrics-server;
minikube addons enable dashboard;

docker build -t nginx-image srcs/nginx/
kubectl apply -f srcs/metallb.yaml


kubectl apply -f srcs/nginx/nginx.yaml

minikube dashboard

kubectl delete all --all
kubectl delete pvc --all
kubectl delete pv --all
