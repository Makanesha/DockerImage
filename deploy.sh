#!/bin/bash
echo "Starting the Docker build and push process..."
docker login -u makanesha -p 041204nesha
docker build -t test .
docker tag test makanesha/guvi:sample
docker push makanesha/guvi:sample
echo "Docker image pushed successfully!"

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get svc test
kubectl get pods
