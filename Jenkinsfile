pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Dev') {
            steps {
                echo 'deployed to dev..'
            }
        }
        stage('Test') {
	    when {
	        branch 'dev'
		}
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
	    when {
	        branch 'Prod'
		}
            steps {
                echo 'Deploying....'
            }
        }
    }
}
