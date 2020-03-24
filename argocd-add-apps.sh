argocd repo add git@github.com:shapirov103/argo-apps.git --ssh-private-key-path ~/.ssh/github_rsa --insecure-ignore-host-key
argocd app create apps --dest-namespace argocd  --dest-server https://kubernetes.default.svc  --repo git@github.com:shapirov103/argo-apps.git --path "."
