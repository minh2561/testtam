pipeline {
    agent any
    stages {
        stage('Build with Gradle') {
            steps {
                sh 'java -version'
            }
        }
        stage('Deploy Spring Boot to DEV') {
            withCredentials([usernamePassword(credentialsId: 'account', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                echo 'Deploying and cleaning'
                sh "sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no ${USERNAME} 'cd /home/minh/tesstJenkins/testtam && ./build.sh'"
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
