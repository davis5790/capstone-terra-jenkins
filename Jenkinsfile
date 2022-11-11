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
		    branch 'Prod'; branch 'main'
		}
            }
	    steps {
		echo 'Testing main branch for QA'
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
