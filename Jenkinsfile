pipeline {
    agent any

    stages {
        stage('Build and Publish') {
            steps {
     withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker build -t ${DOCKER_USERNAME}/sample-webapp:jenkins_L19 ."
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCKER_USERNAME}/sample-webapp:jenkins_L19"           
            }
        }
    }

        stage('Archive') {
            steps {
                // Archive the generated WAR file
                archiveArtifacts artifacts: 'target/sample-webapp.war'
            }
        }
    }
}
