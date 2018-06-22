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

# TODO: enhance this script by enabling this part
#HOME_ACCOUNT=`eval echo "~$USER"`
#if [ ! -d $HOME_ACCOUNT/.ssh ]
#then
#	mkdir -p $HOME_ACCOUNT/.ssh
#fi

HOME_ACCOUNT=/var/lib/jenkins
mkdir $HOME_ACCOUNT/.ssh
cp /vagrant/.ssh/$ACCOUNT/id_rsa* $HOME_ACCOUNT/.ssh/
chown -R $ACCOUNT:$ACCOUNT $HOME_ACCOUNT/.ssh


ACCOUNT=vagrant
HOME_ACCOUNT="/home/"$ACCOUNT
cp /vagrant/.ssh/$ACCOUNT/id_rsa* $HOME_ACCOUNT/.ssh/
chown -R $ACCOUNT:$ACCOUNT $HOME_ACCOUNT/.ssh


# Pushing an example Java code to the Git server
ACCOUNT=vagrant
HOME_ACCOUNT="/home/"$ACCOUNT
mkdir $HOME_ACCOUNT/app
cp -r  /vagrant/example/javaCodeExample $HOME_ACCOUNT/app/
chown -R $ACCOUNT:$ACCOUNT $HOME_ACCOUNT/app

# TODO:  
#  Automate a default repo for testing
# git init
# git remote add origin git@192.168.10.11:/home/git/remoteRepos/testGradleSpockJava.git 
# git add .
# git commit -m "First commit example"
# git push origin master

