# stunnel-docker
stunnel Docker project for x86 &amp; ARM
Sets up a openssh-server with password.
Also sets up the stunnel.

# Most frequently used commands

## Building
``
docker build -t falcoprescher/debian-ssh:1.0 ./ssh
docker build -t falcoprescher/debian-stunnel:1.0 ./stunnel
``

## Run
``
docker run -d --name stunnel -p 2222:22 falcoprescher/debian-ssh:1.0
docker run -d --name stunnel -p 443:443 falcoprescher/debian-stunnel:1.0
``

## Run with specified root password
``
docker run -d --name stunnel -p 2222:22 -e ROOT_PASS="mypass" falcoprescher/debian-ssh:1.0
``

## Logs
``
docker logs ssh
docker logs stunnel
``
##

## Execute additional batch on running container
``
docker exec -it stunnel /bin/bash
``
