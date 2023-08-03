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

         stage('Static code analysis') {
            steps {
                // Sonarcloud analysis
                sh 'mvn sonar:sonar -Dsonar.projectKey=Utkarash-khare_jenkins18_L1 -Dsonar.organization=utkarash-khare -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=Analyze "jenkins18_L1"
            }
        }
        
       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean install package'
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
