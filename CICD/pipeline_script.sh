pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'your_repository_url_here'
            }
        }
        
        stage('Backend Build and Test') {
            steps {
                dir('backend') {
                    sh 'pip install -r requirements.txt'
                    sh 'pytest'
                }
            }
        }
        
        stage('Frontend Build and Test') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }
        stage('Build and Push Docker Images of React Service') {
            steps {
                script {
                    docker.build('frontend-image')
                    docker.withRegistry('https://registry.com', 'credentials-id') {
                        docker.image('frontend-image').push('latest')
                    }
                }
            }
        }
        stage('Build and Push Docker Images of Python Service') {
            steps {
                script {
                    docker.build('backend-image')
                    docker.withRegistry('https://registry.com', 'credentials-id') {
                        docker.image('backend-image').push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes-frontend') {
            steps {
                script {
                    kubectl.apply(file: 'frontend-deployment.yaml')
                }
            }
        }
        stage('Deploy to Kubernetes-backend') {
            steps {
                script {
                    kubectl.apply(file: 'backend-deployment.yaml')
                }
            }
        }
    }
}
