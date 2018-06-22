#!/bin/bash

NEW_REPO=$1
HOME_REPO="/home/git/remoteRepos"
LOCAL_IP=`ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1`

if [ !-d $HOME_REPO ]
then
	mkdir $HOME_REPO
fi

echo -e "Creating new repostiory "$NEW_REPO
git init --bare $HOME_REPO/${NEW_REPO}.git
echo -e " Done"
echo -e " \n How to push to this repo for first time\n
	$ git remote add origin git@"$LOCAL_IP":"$HOME_REPO/$NEW_REPO".git\n
	$ git push -u origin master "
