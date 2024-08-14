pipeline{
    agent any
    environment{
        MAVEN_ARGS = " -e clean install"
        dockerContainerName = 'bookapi'
        dockerImageName = 'bookapi-api'
    }
    stages{
        stage('Build'){
            steps{
                withMaven(maven: 'MAVEN_HOME'){
                    sh "mvn ${MAVEN_ARGS}"
                }
            }
        }
        stage('clean container'){
            steps{
                sh 'docker ps -f name=${dockerContainerName} -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -f name=${dockerContainerName} -q | xargs -r docker container rm'
                sh 'docker images -q --filter=reference=${dockerImageName} | xargs --no-run-if-empty docker rmi -f'
                echo 'clean container'
            }
        }
        stage('docker-compose start'){
            steps{
                sh 'docker-compose up -d --build'
            }
        }
    }
}