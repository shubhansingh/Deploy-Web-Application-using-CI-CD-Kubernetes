pipeline {
    agent any
    
    stages {
        stage('Build and Test Frontend') {
            steps {
                sh 'npm install'
                sh 'npm test'
                sh 'npm build'
            }
        }
        stage('Build and Push Docker Images') {
            steps {
                script {
                    docker.build('frontend-image')
                    docker.withRegistry('https://registry.com', 'credentials-id') {
                        docker.image('frontend-image').push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    kubectl.apply(file: 'frontend-deployment.yaml')
                }
            }
        }
    }
}
