node {

    checkout scm

    stage("build"){
        sh 'python3 Test.py'
    }
    

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_ID') {

        def customImage = docker.build("qsyed/user_pipeline:${env.BUILD_NUMBER}")

        /* Push the container to the custom Registry */
        customImage.push()
        
    }


    stage("deploy to ec2"){
    def docker_rm = 'docker rm -f devbops_user'
    def docker_rmi = 'docker rmi -f $(docker images -a -q)'
    def docker_run = 'docker run -p 8080:80 -d --name devbops_user qsyed/user_pipline:${env.BUILD_NUMBER}'
    

       sshagent(credentials: ['Abdul-private']) {
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${docker_rm}"
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${docker_rmi}"
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${docker_run}"
    

    }

    }
}


