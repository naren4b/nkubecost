echo -n <api-token-key> | base64

apiVersion: v1
kind: Secret
metadata:
  name: gitlab-access
type: Opaque
data:
  token: <base64-encoded-api-token-from-previous-step>

kubectl -n argo-events apply -f gitlab-access.yaml


kubectl apply -n argo-events -f <event-source-file-updated-in-previous-step>

kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/examples/sensors/gitlab.yaml
