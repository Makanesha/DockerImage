
#!/bin/bash

# Exit on error
set -e

# Set the correct kubeconfig if needed (Adjust path as necessary)
export KUBECONFIG=$HOME/.kube/config  # Update path if required

# Ensure Minikube context is selected
echo "🔄 Switching to Minikube context..."
kubectl config use-context minikube

# Docker build process
echo "⚙️ Building the Docker image..."
docker build -t makanesha/task4 .

# Docker login securely
echo "🔑 Logging in to Docker Hub..."
echo "041204nesha" | docker login -u "makanesha" --password-stdin

# Push the new image
echo "🚀 Pushing the Docker image to Docker Hub..."
docker tag makanesha/task4 makanesha/task4
docker push makanesha/task4


# Deploy to Minikube without using a separate YAML file
echo "📦 Deploying to Minikube..."

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devopstask04
spec:
  replicas: 1
  selector:
    matchLabels:
      app: devopstask04
  template:
    metadata:
      labels:
        app: devopstask04
    spec:
      containers:
        - name: devopstask04
          image: makanesha/task4
          ports:
            - containerPort: 80
EOF

echo "✅ Deployment completed successfully!"

# **🔄 Expose the Deployment as a Service**
echo "🌍 Exposing the deployment as a NodePort service..."
kubectl expose deployment devopstask04 --type=NodePort --port=80

# **🔍 Get Service URL**
echo "🔗 Fetching the service URL..."
SERVICE_URL=$(minikube service devopstask04 --url)
echo "🚀 Service is now accessible at: $SERVICE_URL"
