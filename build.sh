#!/bin/bash
docker build -t test .
docker run -itd -p 93:80 mansa

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get service test
