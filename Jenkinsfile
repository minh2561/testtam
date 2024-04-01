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
                sh 'ssh minh@178.128.24.181 -conheohong'
                sh 'pwd'
                sh './login.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
