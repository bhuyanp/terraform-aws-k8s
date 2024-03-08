eksctl create cluster --name test-cluster --version 1.29 --region us-east-1 --node-type=t2.micro --external-dns-access --alb-ingress-access --with-oidc --ssh-public-key my-key-pair

eksctl delete cluster --region=us-east-1 --name=test-cluster
