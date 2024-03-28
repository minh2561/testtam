pipeline {
    agent any
    stages {
        stage('Build with Gradle') {
            steps {
                sh 'java -version'
            }
        }
        stage('Deploy Spring Boot to DEV') {
            agent any
            withCredentials([usernamePassword(credentialsId: 'account', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                steps {
                    echo 'Deploying and cleaning'
                    sh 'sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME}'
                    sh './build'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}