pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/nileshpawar0212/node-docker-app.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nileshpawar0212/node-docker-app:${BUILD_NUMBER} .'
                sh 'docker build -t nileshpawar0212/node-docker-app:latest .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push nileshpawar0212/node-docker-app:${BUILD_NUMBER}'
                    sh 'docker push nileshpawar0212/node-docker-app:latest'
                }
            }
        }
    }
}