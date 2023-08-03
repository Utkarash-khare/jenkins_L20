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
        
       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'clean install package'
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
