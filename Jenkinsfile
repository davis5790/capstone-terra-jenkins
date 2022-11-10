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
	            branch 'dev'
	        }
            steps {
                echo 'Testing..'
            }
        }
        stage('QA') {
            when {
                branch 'Prod'
            }
            steps {
                echo 'Quality Assurance'
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
