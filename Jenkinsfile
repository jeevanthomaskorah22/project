pipeline {
    agent any

    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/jeevanthomaskorah22/project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python -m unittest discover -s tests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t python-flask-app .'
            }
        }

        stage('Save & Upload Docker Image to FTP') {
            steps {
                sh 'docker save python-flask-app > python-flask-app.tar'
                sh 'curl -T python-flask-app.tar ftp://your-ftp-server --user user:password'
            }
        }

        stage('Run Application') {
            steps {
                sh 'docker run -d -p 5000:5000 python-flask-app'
            }
        }
    }
}
