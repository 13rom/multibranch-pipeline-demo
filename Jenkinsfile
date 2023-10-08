pipeline {
    agent any
    stages {
        stage('Clone the repository') {
            steps {
                sh 'pwd'
                sh 'ls -la'
                // git branch: 'feature-branch', url: 'https://github.com/user/repo.git'
            }
        }
        stage('Check commit message') {
            steps {
                // Optional: check commit message for compliance with best practices
            }
        }
        stage('Dockerfiles linting') {
            steps {
                // Dockerfiles linting
            }
        }
    }
    post {
        failure {
            // Block feature branch merging into the main branch
        }
    }
}