#!/bin/bash

echo hi123

# Ensure build.sh exists and is executable
if [ ! -f build.sh ]; then
  echo "build.sh not found!"
  exit 1
fi

chmod +x build.sh
./build.sh

# Docker build and push commands
docker login -u makanesha -p 041204nesha
docker build -t test .
docker tag test makanesha/guvi:sample
docker push makanesha/guvi:sample
docker run -itd -p 93:80 makanesha/guvi:sample

# Kubernetes commands to create deployment, expose it, and get service details
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get service test
