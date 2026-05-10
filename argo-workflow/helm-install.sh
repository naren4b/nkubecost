helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argo argo/argo-workflows --namespace argo --create-namespace \
  --set server.extraArgs[0]="--auth-mode=server" \
  --set workflow.serviceAccount.create=true

kubectl -n argo get deploy argo-argo-workflows-workflow-controller
kubectl -n argo get deploy argo-argo-workflows-server

kubectl -n argo wait deploy --all --for condition=Available --timeout 2m


kubectl -n argo port-forward --address 0.0.0.0 svc/argo-argo-workflows-server 2746:2746 > /dev/null &