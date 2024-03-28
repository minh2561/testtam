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
        agent any
            steps {
                echo 'Deploying and cleaning'
                sh 'docker container kill testJenkin || echo "Container does not exist"'
                sh 'docker container rm testJenkin || echo "Can not kill container because does not exist"'
                sh 'docker image prune || echo "Can not prune image"'
                sh 'chmod +x gradlew'
// 				sh './gradlew clean || echo "Can not gradle clean"'
                sh 'pwd'
                sh 'ls -la'
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}