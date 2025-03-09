pipeline {
    agent {
        label 'docker-agent' // Make sure this matches your agent label
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ptikoo/my-django-blog .'
                sh 'docker push ptikoo/my-django-blog'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl apply -f service.yml'
            }
        }
    }
}
