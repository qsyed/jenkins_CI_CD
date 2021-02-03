pipeline {

     agent { docker { image 'python:3.7.2' } }
     environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        registry = "lmtd/devbops-user-service" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
     }
     stages {
         stage('build') {
             steps {
                    withEnv(["HOME=${env.WORKSPACE}"]) {
                         sh 'pip install flask --user'
                         sh 'pip install boto3 --user'
                         sh 'pip install requests --user'
                         sh 'pip install bcrypt --user'

                     }
                 }
         }
         stage('test') {
             steps {
                 withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'python3 Test.py'
                 }
             }
         }
         stage('build-image'){
             steps{
                 sh 'docker build -t lmtd/devbops_event .'

             }
            

         }

     }
     }