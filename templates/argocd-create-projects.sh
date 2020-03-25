argocd proj create webteam -d https://kubernetes.default.svc,djl-web
argocd proj add-source webteam git@github.com:shapirov103/argo-djl-web.git
