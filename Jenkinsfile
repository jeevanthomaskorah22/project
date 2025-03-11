pipeline {
    agent any  // Runs on any available Jenkins agent

    environment {
        IMAGE_NAME = "hello-python"
        IMAGE_TAG = "v1.0"  // Change this for versioning
        DOCKER_REGISTRY = "ftp://127.0.0.1/FTPFiles"
        FTP_USERNAME = "victus"
        FTP_PASSWORD = "8386"
    }

    stages {
        stage('Git Pull') {
            steps {
                echo 'Pulling latest code from GitHub...'
                git branch: 'main', url: 'https://github.com/jeevanthomaskorah22/project.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Hello World project...'
                bat 'echo Hello, Jenkins! > hello-world.txt'  // Windows batch command
            }
        }

        stage('Generate Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat '''
                docker build -t %IMAGE_NAME%:%IMAGE_TAG% .
                docker save -o %IMAGE_NAME%.tar %IMAGE_NAME%:%IMAGE_TAG%
                '''
            }
        }

        stage('Publish to FTP') {
            steps {
                echo 'Uploading Docker image to FTP...'
                bat '''
                curl -T hello-world.tar --user ftpuser:victus ftp://127.0.0.1/hello-python.tar
                '''
            }
        }
    }
}
