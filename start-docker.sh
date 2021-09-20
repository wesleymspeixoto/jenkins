#!/bin/bash

docker build . \
    --tag wesleypeixoto/jenkins


docker run --name docker-jenkins\
    -d \
    -p 8080:8080 \
    -v jenkins_home:/var/jenkins_home \
    -v jenkins_backup:/srv/backup \
    wesleypeixoto/jenkins