pipeline {
    agent any

    environment {
        KUBE_SECRET_NAME = 'my-registry-secret'  // Secret name for the Docker registry
        DOCKER_USERNAME = 'makanesha'  // Docker Hub username
        DOCKER_PASSWORD = '041204nesha'  // Docker Hub password
        DOCKER_EMAIL = 'makaneshamanasa@gmail.com'  // Docker Hub email
    }

    stages {
        stage('Prepare Kubernetes Secret') {
            steps {
                script {
                    // Create Kubernetes secret for Docker registry access
                    sh """
                        kubectl create secret docker-registry ${KUBE_SECRET_NAME} \
                            --docker-server=https://index.docker.io/v1/ \
                            --docker-username=${DOCKER_USERNAME} \
                            --docker-password=${DOCKER_PASSWORD} \
                            --docker-email=${DOCKER_EMAIL} || true
                    """
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x deploy.sh'

                // Build the Docker image using the build script
                sh './deploy.sh'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply the Kubernetes deployment and service files
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
