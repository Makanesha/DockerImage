pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub' // Use your Docker Hub credentials ID
        KUBECONFIG = credentials('kubeconfig') // Use the ID of your kubeconfig credential
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build and Deploy') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'makanesha', usernameVariable: '041204nesha')]) {
                        sh """
                        chmod +x deploy.sh
                        ./deploy.sh
                        """
                    }
                }
            }
        }
    }
}
