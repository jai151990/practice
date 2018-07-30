pipeline { 
    agent any 
    stages {
        stage('checkout') { 
            steps { 
                checkout scm 
            }
        }
        stage('build'){
            steps {
                sh 'mvn install'
            }
        }
        stage('clean') {
            steps {
                sh 'mvn clean'
            }
        }
    }
}
