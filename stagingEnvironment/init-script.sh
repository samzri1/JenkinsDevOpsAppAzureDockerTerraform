#!/bin/bash

#Installing Docker 
sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt -y update
sudo apt -y install docker-ce

#Creating container 
docker run -p 1234:1234 samzri/countdown-app
