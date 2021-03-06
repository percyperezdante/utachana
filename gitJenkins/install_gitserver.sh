#!/bin/bash


# Installing package
apt-get update
apt-get install git-core

# Add git user
ACCOUNT=git
HOME="/home/"$ACCOUNT

useradd -m $ACCOUNT -s /bin/bash
mkdir $HOME/.ssh
chmod 700 $HOME/.ssh
chown -R $ACCOUNT:$ACCOUNT $HOME

# TODO: this works but it requires a script to share keys with other servers
#su $ACCOUNT
#ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -N ""
#chown -R $ACCOUNT:$ACCOUNT $HOME

# Temporal solution
cp /vagrant/.ssh/git/id_rsa* $HOME/.ssh/

# Main folder for repositories
mkdir $HOME/remoteRepos

# Copying tools
cp /vagrant/create_remote_gitrepo.sh $HOME/
cat /vagrant/.ssh/vagrant/id_rsa.pub >> $HOME/.ssh/authorized_keys
cat /vagrant/.ssh/jenkins/id_rsa.pub >> $HOME/.ssh/authorized_keys
chmod 755 $HOME/create_remote_gitrepo.sh

# Updating ownership
chown -R $ACCOUNT:$ACCOUNT $HOME

# Creating a tests  GIt repository
# TODO: enhance below by creating an example
#su git
#cd
#./create_remote_gitrepo.sh testGradleSpockJava


