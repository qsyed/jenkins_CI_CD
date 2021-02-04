node {
    stage('Git Checkout'){
        git branch: 'dev', credentialsId: 'git-creds', url: 'https://github.com/qsyed/jenkins_CI_CD.git'
    }
    
    stage("testing"){
        sh "pip3 install -r requirements.txt"
        sh "python3 Test.py"
    }
    
    stage("build docker images"){
        sh "docker build -t qsyed/user-service:${env.BUILD_NUMBER} ."
    }
    
    
}