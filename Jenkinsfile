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
                sh 'docker container rm testJenkin || echo "Can not kill container because does not exist"'
                sh 'docker image prune || echo "Can not prune image"'
				sh './gradlew clean || echo "Can not gradle clean"'
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