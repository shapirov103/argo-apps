# create namespace
kubectl create namespace argocd

# install argo
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argocd/stable/manifests/install.yaml

# patch service to loadbalancer to enable ingress
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# get initial password for the cluster, will output to the console
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

# will prompt for user name and pwd. username is "admin", pwd - see above command, pwd will appear on screen
argocd login <load-balancer-url-for-argocd-service>

# change admin pwd 
argocd account update-password


