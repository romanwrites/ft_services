minikube start --vm-driver=virtualbox --cpus=2 --disk-size="10000mb" --memory="3000mb"
eval $(minikube docker-env)

minikube addons enable metallb;
minikube addons enable metrics-server; #do need?
minikube addons enable dashboard;

kubectl apply -f srcs/metallb.yaml
docker build -t nginx srcs/nginx/

kubectl apply -f srcs/nginx/nginx.yaml

minikube dashboard

# kubectl delete all --all
# kubectl delete pvc --all
# kubectl delete pv --all
