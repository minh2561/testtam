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
                sh 'docker container kill testJenkin || echo "Container does not exist"'
                sh 'docker container rm testJenkin || echo "Can not kill container because does not exist"'
                sh 'docker image prune || echo "Can not prune image"'
                sshagent(credentials: ['rsa-key']) {
                echo 'connect to server'
                    sh """ssh -o StrictHostKeyChecking=no minh@178.128.24.181 << END
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
