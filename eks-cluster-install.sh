
CLUSTER_NAME=argo-cluster

# Provision cluster: ~15 min 
eksctl create cluster --name=${CLUSTER_NAME} --nodes=3 --managed --alb-ingress-access --region=${AWS_REGION}

# Add OIDC provider for RBAC/IaM integration
eksctl utils associate-iam-oidc-provider  --name argo-cluster --approve

eksctl create iamserviceaccount \
    --name djl-backend-account \
    --namespace djl-api \
    --cluster argo-cluster \
    --attach-policy-arn arn:aws:iam::929819487611:policy/AccessDjlBucket \
    --approve \
    --override-existing-serviceaccounts

eksctl create iamserviceaccount \
    --name djl-web-account \
    --namespace djl-web \
    --cluster argo-cluster \
    --attach-policy-arn arn:aws:iam::929819487611:policy/AccessDjlBucket \
    --approve \
    --override-existing-serviceaccounts