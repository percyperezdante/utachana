
# About this site

This site contains instructions of examples on how to configuter jenkins tasks with gradle and java. 

# How to set Jenkins for first time

1. The initial password is located at

```console
/var/lib/jenkins/secrets/initialAdminPassword
or
~/.jenkins/secrets/initialAdminPassword
```
Copy it and paste in the first box of the first page of Jenkins.

2. Select "install suggested plugins"

3. Create own administrative account

3. Select the default option ( for now )

4. Be sure the the following plugins are installed:
```console
Gradle pluign
Git
Junit
Post build task
```
# How to create GIT repository in the git server

```console

./create_remote_gitrepo.sh myFirstRepo

```

# How to configure Jenkins task to a remote Github

1. Click new item/task

2. Enter a unique name for task, select "Freestyle project" (for now) and then OK

3. Fill in the form as below

- General:     
Add a description of the item or task

- Source Code Management: 
Select Git and enter the URL of the Java source code to clone, for example:
> https://github.com/percyperezdante/javaTestCode.git

- Build triggers:  
Leave all as default

- Build environment:
Select "Add timestamps to the Console Output"

- Build:

Select "ADD build step"\
Select "Invoke gradle script"\
Type in Tasks:  clean test build

- Post build actions:

>Select "Add post-build action"\
Select "Publish Junit test resuts report", and copy the path where 
the test results are located. In our example they are located at:\
build/test-results/test/*.xml


>Select "Add post-build action"\
Select "Pot build task" ( this requires the Post build plugin )\
Select "Run script only if all previous steps were successful	"\
Type in Script : the commnad or script to run the application in the server
in our example we run as:\
java -jar build/libs/mm-0.1.1.jar


- Save and click on "Build now" 

# How to configure Jenkins task to own Git server

The procedure to fill in the form  is similart to the Github one, except that
in the Source Code Management section the URL becomes the ssh or https connection
to the local git server. In our example:


Repositoy URL:\
ssh://git@192.168.10.11:/home/git/remoteRepos/testGradleSpockJava.git
