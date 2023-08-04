pipeline {
    agent any

    environment {
        PATH = "/opt/maven/bin:${env.PATH}"
    }

    stages {
        stage('Test') {
            steps {
                // Run the unit tests using Maven
                sh 'mvn test'
            }
        }

        stage('Build App') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean install package'
            }
        }

        stage('Build and Publish') {
            steps {
     withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker build -t ${DOCKER_USERNAME}/sample-webapp:jenkins_L19 ."
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCKER_USERNAME}/sample-webapp:jenkins_L19"           
            }
        }
    }

        stage('Run Container') {
            steps {
                // Run the Docker container
                script {
                    docker.image('khareutkarsh/sample-webapp:jenkins_L19').run('-p 8080:80')
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
