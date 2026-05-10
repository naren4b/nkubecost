kubectl create ns argo-events

kubectl apply -n argo-events -f https://github.com/argoproj/argo-events/releases/download/v1.9.9/install.yaml

kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/examples/eventbus/native.yaml



#The Events Controller-Manager: 
kubectl -n argo-events get deploy controller-manager

#An eventbus statefulset: 
kubectl -n argo-events get statefulsets eventbus-default-stan

#A minio eventsource pod: 
kubectl -n argo-events get pod -l eventsource-name=minio