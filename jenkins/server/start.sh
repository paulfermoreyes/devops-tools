#! /bin/bash

# TODO: Serve as Linux Service

# TODO: Serve as Docker Container
echo "Checking if 'jenkins' docker network exists..."
docker network list | awk '{print $2}' | grep 'jenkins'
if [[ $? -ne 0 ]] then;
    echo "Creating 'jenkins' docker network"
    docker network create jenkins
fi

echo "Starting Jenkins Docker-in-Docker Service"
docker run \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind
#   --storage-driver overlay2

echo "Building custom Jenkins image"

echo "Starting Jenkins Server with Blueocean"
docker run \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.3-1
