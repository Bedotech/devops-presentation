#!/bin/bash

DOCKER_CONTAINER_NAME="ansible-test"
DOCKER_CONTAINER_TAG="ansible-ubuntu-puppet"

docker build -t $DOCKER_CONTAINER_TAG .

docker run -ti --rm --privileged --name $DOCKER_CONTAINER_NAME -d -p 5000:22 $DOCKER_CONTAINER_TAG

ansible-playbook -i local webserver.yml -vvv
echo "Rerun!"
ansible-playbook -i local webserver.yml -vvv

docker stop $DOCKER_CONTAINER_NAME
