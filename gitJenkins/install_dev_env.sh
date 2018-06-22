#!/bin/bash

# This script install all necessary tools for the DEV node.
# It includes install jenkins, sdk, and gradle

# Install jenkins, jdk, and gradle
apt-get -y install openjdk-8-jdk apt-transport-https 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get -y install jenkins  gradle

# Config keys for jenkins
ACCOUNT=jenkins
HOME_ACCOUNT=`eval echo "~$USER"`
if [ ! -d $HOME_ACCOUNT/.ssh ]
then
	mkdir -p $HOME_ACCOUNT/.ssh
fi

cp /vagrant/.ssh/$ACCOUNT/id_rsa* $HOME_ACCOUNT/.ssh/
chown -R $ACCOUNT:$ACCOUNT $HOME_ACCOUNT/.ssh
#chmod 644 /home/vagrant/.ssh/id_rsa.pub
#chmod 600 /home/vagrant/.ssh/id_rsa

