pipeline {
    agent any
    
    environment {
        PROJECT_ID = 'sr-devops-test'
        IMAGE_NAME = 'sr-devops'
        IMAGE_TAG = 'latest' 
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/pankajyadav05/sr-devops.git'
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                dir('frontend') {
                    script {
                        writeFile file: 'Dockerfile', text: '''
                            FROM node:14-alpine
                            
                            WORKDIR /app
                            COPY package*.json ./
                            RUN npm install
                            COPY . .
                            RUN npm run build
                            EXPOSE 3000
                            CMD ["npm", "start"]
                        '''
                        
                        def customImage = docker.build("${PROJECT_ID}/${IMAGE_NAME}:${IMAGE_TAG}", ".")
                        docker.withRegistry("https://gcr.io", 'your-gcp-credentials-id') {
                        customImage.push()
                    }
                    }
                }
            }
        }
        
        // stage('Deploy to Kubernetes-frontend') {
        //     steps {
        //         script {
        //             kubectl.apply(file: 'frontend-deployment.yaml')
        //         }
        //     }
        // }
 
    }
}
