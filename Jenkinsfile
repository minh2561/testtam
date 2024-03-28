pipeline {
    agent any
    stages {
        stage('Build with Gradle') {
            steps {
                sh 'java -version'
            }
        }
        stage('Deploy Spring Boot to DEV') {
            steps {
                echo 'Deploying and cleaning'
                sh "chmod +x login"
                sh "./login.sh"
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
