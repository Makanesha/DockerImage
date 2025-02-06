#!/bin/bash

# Output message to confirm script execution
echo "Starting the Docker build and push process..."

# Docker login
docker login -u makanesha -p 041204nesha

# Build the Docker image
docker build -t test .

# Tag the Docker image
docker tag test makanesha/guvi:sample

# Push the Docker image to Docker Hub
docker push makanesha/guvi:sample

echo "Docker image pushed successfully!"

# Now run the Kubernetes deployment and expose the service

# Create the deployment using kubectl
kubectl apply -f deployment.yaml

# Create the service using kubectl
kubectl apply -f service.yaml

# Get the service details to confirm everything is running correctly
kubectl get svc test

# Optionally, you can check the pods as well
kubectl get pods
