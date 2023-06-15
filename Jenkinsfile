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
