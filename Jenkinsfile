pipeline {
    agent any

    tools { 
        maven 'my-maven' 
    }
    
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
                sh 'docker container rm testJenkin'
                sh 'docker image prune'
				sh './gradlew clean'
                sh './gradlew bootJar'
                sh 'docker compose up -d'
                sh 'docker container start -it testJenkin || echo "Run container success"'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}