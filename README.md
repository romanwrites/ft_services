# ft_services [in process...]
Learning to use Kubernetes

> "Kubernetes is an open source project that enables software teams of all sizes, from a small startup to a Fortune 100 company, to automate deploying, scaling, and managing applications on a group or cluster of server machines.
>These applications can include everything from internal-facing web applications like a content management sysrtem to marquee web properties like Gmail to big data processing."

<div style="text-align: right">— Joe Beda</div>

## Install
coming soon

## Research / abstract

* [Kubernetes Tutorial for Beginners [Full Course in 4 Hours]](https://youtu.be/X48VuDVv0do)

* [Nginx documentation](http://nginx.org/en/docs/beginners_guide.html)

### Enabling zsh autocompletion

Add this to `~/.zshrc`
```
source <(kubectl completion zsh)
```

Kubernetes has a plug-n-play architecture that allows to extend it when need to.

Health checks are available from a box. Such as: TCP, HTTP or container execution.

### Abstractions

#### Pod

Pod is container in k8s

Pods can be assigned to nodes

Pods can use persistent volumes to store data

#### Node
node			

#### Cluster
cluster
```

Kubernetes auto-completion.
```
source <(kubectl completion bash)
```

In Kubernetes, all containers run in pods.

Some examples:

`kubectl create deployment nginx --image=nginx:1.10.0`

`kubectl get pods` to view the pods.

To expose the nginx container outside Kubernetes
`kubectl expose deployment nginx --port 80 --type LoadBalancer`

`kubectl get services` to view services

`kubectl scale deployment nginx --replicas 3`
creates 3 replica pods

built-in pod documentation `kubectl explain command`

`kubectl describe pods [NAME]` to get more info


`kubectl port-forward` to map a local port to a port inside the monolith pod

`kubectl port-forward monolith 10080:80`


How to see which `node` a `pod` belongs?
```
kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces
```

or simply `kubectl get pods -o wide`

`kubectl logs -f monolith` to get a stream of logs in real time

## Links
* [Kubernetes cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)