# Setting up a Functional CI / CD pipeline 

> the first thing you need is a jenkins sever running in a public subnet. If you dont have that please refer to my github repo titled "jenkins-ec2"


> the second thing you need is a second server in a private subnet. this will rpresent different stages such as dev, pre-production, and production. Its imporatnat to note that you should add an ssh rule to your ip when launching the server: 

<img src = "imgs/sg.png>