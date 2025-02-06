pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Build the Docker image and push it to Docker Hub
                sh './deploy.sh'
            }
        }
    }
}
