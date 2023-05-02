pipeline {
    agent {
        docker {
            image:'ruslandee/jenkins-agent:latest'
        }
    }

    stages {
        stage ('Copy source with configs') {
            steps {
                echo 'Checkout git branch'
                git (url: 'https://github.com/ruslandee7/boxfuse.git')
            }
        }
        stage ('Build war') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('Make docker image') {
            steps{
m               echo 'Make docker image'
            }
        }
        stage ('Run Docker on production server') {
			input {
				message "Confirm deploy to prod"
				ok "Go!"
			}
			steps {
				echo "Deploying to prod"
			}
		}
	}
}