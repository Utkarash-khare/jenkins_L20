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

        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    def NAMESPACE = env.BRANCH_NAME

                    // Replace the placeholder in the template with the actual namespace
                    sh "kubectl config set-context --current --namespace=${NAMESPACE}"

                    // Apply the modified YAML file to Kubernetes
                    sh "kubectl apply -f manifest.yaml"
                }
            }
        }
    }
}

