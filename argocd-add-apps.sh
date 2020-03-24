argocd app create apps --dest-namespace argocd  --dest-server https://kubernetes.default.svc  --repo git@github.com:shapirov103/argo-apps.git --path "."
argocd app sync apps 