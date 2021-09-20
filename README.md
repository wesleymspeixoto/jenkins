# Ambiente Dev

blueghost-jenkins


- Jenkins

user: admin
password: blueghostjenkinsdev@#!


docker build . \
    --tag wesleypeixoto/jenkins-dev:1.0.0


docker run --name docker-jenkins-dev \
    -d \
    -p 8080:8080 \
    -v jenkins_home:/var/jenkins_home \
    -v jenkins_backup:/srv/backup \
    e84fb6f8e91d

docker inspect bfe94b78ef64 | grep backup


docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -q)


