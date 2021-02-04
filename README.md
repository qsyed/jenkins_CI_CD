# Setting up a Functional CI / CD pipeline 

> The first thing you need is a jenkins sever running in a public subnet. If you dont have that please refer to my github repo titled "jenkins-ec2" 

> from the command line of your public server execute the following commands to get the follow softwares and set the rght permissons:

* sudo yum install git -y
* sudo yum install python3 -y
* sudo amazon-linux-extras install docker -y 
* sudo yum install docker
* sudo su -
* sudo service docker start
* sudo sytemctl enable dokcer
* sudo su - ec2-user
* sudo usermod -a -G docker jenkins
* docker --version to confirm docker was installed
* git --version to confirm git was installed


> The second thing you need is a second server in a private subnet. this will rpresent different stages such as dev, pre-production, and production. 


> in our program we are using the boto3 SDK. we have to add enviromental variables so that our test work. the following is an example of how to set that up (go to Jenkins - Manage Jenkins - Configure System - Global properties - Environment variables)

<img src = "imgs/env.png">










https://stackoverflow.com/questions/44444099/how-to-solve-docker-permission-error-when-trigger-by-jenkins/44444163
https://serverfault.com/questions/883873/how-give-aws-credential-to-jenkins-pipeline
https://dzone.com/articles/building-docker-images-to-docker-hub-using-jenkins   
