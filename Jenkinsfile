void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/13rom/multibranch-pipeline-demo"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}

pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/feature-*']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-personal-access-token', url: 'https://github.com/13rom/multibranch-pipeline-demo.git']])
            }
        }

        stage('Check Commit Message Format') {
            steps {
                script {
                    def lastCommitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()

                    def regexPattern = /^.{1,50}(?:\n\n.{1,72})?$/

                    if (lastCommitMessage =~ regexPattern) {
                        echo "Commit message format is valid."
                    } else {
                        error("Commit message format is not valid. It should match the specified pattern.")
                    }
                }
            }
        }

        stage('Lint Dockerfile') {
            steps {
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }

        stage('Check docker-compose file') {
            steps {
                sh 'docker compose -f docker-compose.yml config'
            }
        }
    }
    post {
        success {
            setBuildStatus("Build succeeded", "SUCCESS");
        }
        failure {
            setBuildStatus("Build failed", "FAILURE");
        }
    }
}
