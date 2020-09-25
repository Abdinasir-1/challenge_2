#COMMANDS FOR CHALLENGE 2

#Creating clone
git clone https://gitlab.com/qacdevops/trio-task.git
# Go into the Dir
cd trio-task
#create and edit dockerfile
vim Dockerfile
#Inside Dockerfile
FROM python:3.7
RUN pip install flask flask_sqlalchemy pymysql
COPY flask-app/ .
EXPOSE 500
ENTRYPOINT ["python", "app.py"]
#build image
sudo docker build -t flask-app
#to check docker images
sudo docker images

#to run container 
sudo docker run -d -p 5000:5000 --name flask-app flask-app
#to check container running 
sudo docker ps
#run image and container
sudo docker exec -it flask-app bash
#inside bash shell
ls 
python "app.py"
exit
#then check localhost:5000 on web broswer inside the terminal
firefox

#To create container for mysql 
#as there was a folder containing the sql file I changed to that directory
cd db
#dockerfile already present - to edit
vim Dockerfile
#Inside Dockerfile
FROM mysql:5.7
ENV MYSQL_DATABASE=flask.db
COPY CreateTable docker-entrypoint-initdb.d/ (#this was seen in the folder when it was cloned asthis is the sql file) 
#build the image
sudo docker build -t flask-db
#check images
sudo docker images
#to run container using that image
sudo docker run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=root flask-db
#check running container
sudo docker ps
#run image on container by going into the mysql bash shell
sudo docker exec -it flask-db bash
#inside bash shell
mysql -uroot -p
#enter password created 
root
#mysql command shell 
mysql> SHOW DATABASES;
exit

#in order to now push this into the public repo
git clone https://github.com/Abdinasir-1/challenge_2.git

#copy and move trio-task dir into challenge_2 dir
cp -r trio-task/ challenge_2/
#move to the dir of the repo
cd challenge_2
#add new file to show all commands
vim commands.sh
#check the status of the repo 
git status
# to add all files/folder to be pushed 
git add -A
#add message of files/folder to be pushed
git commit -m "first commit"
#pushed to repo
git push -u origin master
#enter repo details
username+password
#check repo on web browser
github.com/abdinasir-1/challenge_2

