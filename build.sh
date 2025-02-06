#!/bin/bash
docker build -t test .


kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get service test
