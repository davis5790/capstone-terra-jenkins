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
		anyOf {
		    branch 'prod-*'; branch 'main-*'
		}
            }
	    steps {
		echo 'Testing branch for QA'
	    }		
        }
        stage('Deploy') {
	    when {    
		branch 'main-*'
	    }
            steps {
                echo 'Deploying....'
            }
        }
    }
}
