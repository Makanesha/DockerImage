#!/bin/bash

echo hi123



# Docker build and push commands
docker login -u makanesha -p 041204nesha
docker build -t test .
docker tag test makanesha/guvi:sample
docker push makanesha/guvi:sample
docker run -itd -p 94:80 makanesha/guvi:sample

# Kubernetes commands to create deployment, expose it, and get service details
