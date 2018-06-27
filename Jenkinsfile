pipeline {
    agent any
    stages {
        stage('Branch Checkout') {
            // Checkout the branch of the simple-project framework repository
            
            steps {
                git branch: 'master', url: 'https://github.com/al-flex/simple-project.git'
            }
        }
        stage('Phpunit Test') {
            // Run PHPUnit test.
            when {
                not {
                    branch 'feature/unstable'
                }
            }

            steps { 
                sh './vendor/bin/phpunit --bootstrap vendor/autoload.php tests/EmailTest --configuration vendor/phpunit/php-code-coverage/phpunit.xml'
            }
        } 
    }
    post {
        success {
            sh 'curl -X GET https://webhook.site/11fb3b4e-0854-439a-991e-61566011797a/the-build-is-passed'
        }
        failure {
            sh 'curl -X GET https://webhook.site/11fb3b4e-0854-439a-991e-61566011797a/oh-nooooo-build-is-failing'
        }
    }
}