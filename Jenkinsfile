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
                sshagent(credentials: ['rsa-key']) {
                    sh """ssh -o StrictHostKeyChecking=no minh@178.128.24.181 << END
                    docker container kill testJenkin
                    docker container rm testJenkin
                    git pull
                    chmod +x gradlew
                    chmod +x build.sh
                    ./build.sh
                    docker-compose up -d """
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
