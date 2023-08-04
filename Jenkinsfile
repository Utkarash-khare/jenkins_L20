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

        stage('Build Image') {
            steps {
                // Building docker image
                sh 'docker build -t $(DOCKER_USERNAME)/sample-webapp:L19'
            }
        }

        stage('Publish Image') {
            steps {
                // Authenticate with Docker Hub using Docker login
                sh 'docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)'

                // Push the Docker image to Docker Hub
                sh 'docker push $(DOCKER_USERNAME)/sample-webapp:L19'
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
