pipeline {
    agent any
    environment {
        SSH_HOST = '178.128.24.181'
        SSH_USER = 'minh'
    }
    stages {
        stage('Build with Gradle') {
            steps {
                sh 'java -version'
            }
        }
        stage('Deploy Spring Boot to DEV') {
            steps {
                script {
                    try {
                        echo 'Connecting to server...'
                        sh """ssh ${SSH_USER}@${SSH_HOST} << 'END'
                        docker container kill testJenkin
                        docker container rm testJenkin
                        docker image rm testtam-app
                        cd /home/minh/newFolder/codeTest/testtam
                        git pull
                        chmod +x gradlew
                        chmod +x build.sh
                        ./build.sh
                        docker-compose up -d
                        END
                        """
                    } catch (Exception e) {
                        echo "Error: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
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
