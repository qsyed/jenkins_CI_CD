node {


    stage("Git Checkout"){
        checkout scm

    }

    stage("Testing"){
        sh 'pip3 install -r requirements.txt'
        sh 'python3 Test.py'
    }
    

    stage("Build - Push to Docker"){

    
    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_ID') {

        def customImage = docker.build("qsyed/user_pipeline:${env.BUILD_NUMBER}")

        /* Push the container to the custom Registry */
        customImage.push()
        customImage.push('latest')
        
    }

    }



    stage("Deploy to ec2"){
    def docker_rm = 'docker rm -f devbops_user'
    def docker_run = 'docker run -p 8080:80 -d --name devbops_user qsyed/user_pipeline'
    

       sshagent(credentials: ['Abdul-private']) {
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${docker_rm}"
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${docker_run}"
    

    }

    }


    stage("Delete all local docker"){
        sh 'docker rmi -f $(docker images -a -q)'

    }
}


