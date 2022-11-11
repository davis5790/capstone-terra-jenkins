pipeline {
    agent any
    stages {
        stage('Dev') {
            steps {
                echo 'deployed to dev..'
            }
        }
        stage('Test') {
          steps {
                echo 'Testing..'
            }
        }
        stage('QA') {
            when {
                branch 'Prod' || 'main'
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
