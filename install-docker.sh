#!/bin/bash
# wget https://github.com/daznext/ais-astra/raw/master/install-docker.sh -O - | /bin/bash -

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

