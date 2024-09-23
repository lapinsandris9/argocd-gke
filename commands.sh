gcloud container clusters get-credentials argocd-cluster --zone us-central1-c --project cwise-test-account

k get nodes
k describe node ... 

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argocd
helm show values argo/argo-cd --version 3.35.4 > argo-defaults.yml

helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml
# OR
terraform apply

helm status argocd -n argocd
helm list --pending -A
helm list -A

k get secrets argocd-initial-admin-secret -o yaml -n argocd
echo "WmhnOFRpN0g3Q2NteThKTg==" | base64 -d
k port-forward svc/argocd-server -n argocd 8080:80
# ON BROWSER
http://localhost:8080/applications

docker login --username andrislapins
docker pull nginx:1.23.3

docker tag nginx:1.23.3 andrislapins/nginx:v0.1.0
docker images

# SIMULATE CI CD process - image version update
docker tag nginx:1.23.3 andrislapins/nginx:v0.1.1
docker push andrislapins/nginx:v0.1.1
Zhg8Ti7H7Ccmy8JN