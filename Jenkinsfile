node {

    stage("build"){
        sh 'python3 Test.py'
    }
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_ID') {

        def customImage = docker.build("qsyed/user_pipeline:${env.BUILD_NUMBER}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}


