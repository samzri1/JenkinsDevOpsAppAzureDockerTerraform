node{

    stage('Clone') {
      git credentialsId: '10fedfbb-8a4e-4700-b3cd-3ad56c87c166', url: 'https://github.com/obabaldbiyat/brief14.git'
    }
    stage ('Build Image') {
       script{
                    sh 'sudo docker build -t brief14_app_obab .'
                }
    }
     stage ('Docker Tag') {
        script {
                    sh 'docker tag brief14_app_obab obab/brief14_app_obab'             
                }
    }
     stage('Login') {
        script{
                    sh 'sudo docker login -u obab -p dckr_pat_9jVuDM0t2Zv5Ilw5AdUGSsOJnSo'
                }
    }      
     stage('Push to Docker Hub') {    
        script {
                    sh 'sudo docker push obab/brief14_app_obab'
                }
    }
}

pipeline {
    agent any
    environment {
      MY_CRED = credentials('c1de710d-a52b-4c8c-9196-0f24a0dd5194')
    }
  
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '10fedfbb-8a4e-4700-b3cd-3ad56c87c166', url: 'https://github.com/obabaldbiyat/JenkinsDevOpsAppAzureDockerTerraform.git'
            }
        }
        stage('conection') {
            steps {
               sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
      }
    }
        stage('Terraform init Prod') {
            steps {
                sh 'cd ProdEnvironment && terraform init'
            }
        }
        stage('Terraform Plan Prod') {
            steps {
                sh 'cd ProdEnvironment && terraform plan'
            }
        }
        stage('Terraform apply Prod') {
            steps {
                sh 'cd ProdEnvironment && terraform apply --auto-approve'
            }
        }
        
    }
}
