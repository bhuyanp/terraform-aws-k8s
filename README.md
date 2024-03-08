eksctl create cluster --name test-cluster --version 1.29 --region us-east-1 --node-type=t2.micro --external-dns-access --alb-ingress-access --with-oidc --ssh-public-key my-key-pair

eksctl create cluster \
    --name test-cluster \
    --version 1.29 \
    --region us-east-1 \
    --zones us-east-1a,us-east-1b \
    --fargate \
    --external-dns-access \
    --alb-ingress-access \
    --with-oidc \
    --ssh-public-key bhuyanp

    ##--node-type=t2.micro \

eksctl delete cluster --region=us-east-1 --name=test-cluster

```
docker build --build-arg MODULE=customer-service -t fs-app-customer-service .
docker build --build-arg MODULE=product-service -t fs-app-product-service .
```

