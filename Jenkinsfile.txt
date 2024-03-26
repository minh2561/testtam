pipeline {
    agent any

    tools { 
        maven 'my-maven' 
    }
    
    stages {
        stage('Build with Gradle') {
            steps {
                sh 'gradlew --version'
                sh 'java -version'
                sh 'apt install openjdk-17-jdk openjdk-17-jre || "install jdk failed"'
            }
        }

        stage('Deploy Spring Boot to DEV') {
            steps {
                echo 'Deploying and cleaning'
                sh 'docker container kill testJenkin || echo "Container does not exist"'
                sh 'echo y | docker container prune'
				sh './gradlew clean'
                sh './gradlew bootJar'
                sh 'docker compose up -d'
                sh 'docker container start testJenkin || echo "Run container success"'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}