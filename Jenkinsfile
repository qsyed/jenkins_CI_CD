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
    //    def dockerRm = 'docker rm -f devbops_user'
    //    def dockerRmI = 'docker rmi -f $(docker images -a -q)'
    //    def dockerRun = 'docker run -p 8080:80 -d --name devbops_user qsyed/user_pipline'
    def runnerfirstContainer = 'docker run -p 8080:80 -d qsyed/user_pipeline:7'

       sshagent(credentials: ['Abdul-private']) {
           sh "ssh -o StrictHostKeyChecking=no ec2-user@172.25.11.252 ${runnerfirstContainer}"
    

    }

    }
}


