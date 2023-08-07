pipeline {
  agent any
  triggers {
    pollSCM '* * * * *'
  }
  stages {

   stage('Docker build and push') {
      steps {
        sh '''
         whoami
         DOCKER_LOGIN_PASSWORD=$(aws ecr get-login-password  --region ap-south-1)
         docker login -u AWS -p $DOCKER_LOGIN_PASSWORD https://654447262445.dkr.ecr.ap-south-1.amazonaws.com
         docker build -t 654447262445.dkr.ecr.ap-south-1.amazonaws.com/sample:SAMPLE-PROJECT-${BUILD_NUMBER} .
         docker push 654447262445.dkr.ecr.ap-south-1.amazonaws.com/sample:SAMPLE-PROJECT-${BUILD_NUMBER}
          
	  '''
     }   
   }
    
    stage('ecs deploy') {
      steps {
        sh '''
          chmod +x changebuildnumber.sh
          ./changebuildnumber.sh $BUILD_NUMBER
	      sh -x ecs-auto.sh
          '''
     }    
    }
}
}

