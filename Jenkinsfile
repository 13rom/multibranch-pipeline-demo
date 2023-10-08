pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/feature-*']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-personal-access-token', url: 'https://github.com/13rom/multibranch-pipeline-demo.git']])
            }
        }
        stage('Check commit messages') {
            steps {
                sh 'echo "Checking..."'
            }
        }
        stage('Lint Dockerfiles') {
            steps {
                sh 'echo "Linting..."'
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }
    }
}
