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
                echo 'connect to server'
                sh """ssh minh@178.128.24.181 << END
                docker container kill testJenkin
                docker container rm testJenkin
                docker image rm testtam-app
                git pull
                chmod +x gradlew
                chmod +x build.sh
                ./build.sh
                docker-compose up -d """
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
