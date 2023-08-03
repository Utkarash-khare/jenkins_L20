pipeline {
    agent any

    stages {

         stage('Test') {
            steps {
                // Run the unit tests using Maven
                sh '/opt/maven mvn test'
            }
        }
        
       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh '/opt/maven mvn clean install package'
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
