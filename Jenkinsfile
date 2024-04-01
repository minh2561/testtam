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
                script {
                    def remote = [
                        host: '178.128.24.181',
                        user: 'minh',
                        password: 'conheohong',
                        allowAnyHosts: true
                    ]
                    sshScript remote: remote, script: "cd /home/minh/newFolder/codeTest"
                    sshScript remote: remote, script: "git clone https://github.com/minh2561/testtam.git"
                    sshScript remote: remote, script: "chmod +x build.sh"
                    sshScript remote: remote, script: "./build.sh"
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
