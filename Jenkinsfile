pipeline {
    agent any
    stages {
        stage('Dev') {
            steps {
                echo 'deployed to dev..'
            }
        }
        stage('Test') {
	    when {
	        branch 'Prod'
		}
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
	    when {
	        branch 'main'
		}
            steps {
                echo 'Deploying....'
            }
        }
    }
}
