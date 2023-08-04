pipeline {
    agent any

 parameters {
        string(name: 'DOCKERHUB_CREDENTIALS', defaultValue: '', description: 'Docker Hub credentials ID')
    }

    stages {

        stage('Build & Publish') {
            steps {
                script {
                    // Get the current Git branch name
                    def branchName = env.BRANCH_NAME

                    // Construct the Docker image name based on the branch name
                    def dockerImageName = "khareutkarsh/${branchName}-sample-webapp:L20_jenkins"

                    // Using the global credentials directly in the `withCredentials` block
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker build -t ${dockerImageName} ."
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${dockerImageName}"
                    }
                }
            }
        }
    }
}
