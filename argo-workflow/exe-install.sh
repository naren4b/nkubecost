curl -s https://raw.githubusercontent.com/argoproj-labs/training-material/main/argo-workflows/install.sh | AUTHCLIENT=1 sh
kubectl -n argo port-forward --address 0.0.0.0 svc/argo-server 2746:2746 > /dev/null &
