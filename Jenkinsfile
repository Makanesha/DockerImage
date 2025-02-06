pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
           steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: '041204nesha', usernameVariable: 'makanesha')]) {
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
