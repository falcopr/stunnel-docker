# stunnel-docker
stunnel Docker project for x86 &amp; ARM
Sets up a openssh-server with password.
Also sets up the stunnel.

# Most frequently used commands

## Building
``
docker build -t falcoprescher/stunnel:1.0 .
``

## Run
``
docker run -d --name stunnel -p 2222:22 falcoprescher/stunnel:1.0
``

## Run with specified root password
``
docker run -d --name stunnel -p 2222:22 -e ROOT_PASS="mypass" falcoprescher/stunnel:1.0
``

## Logs
``
docker logs stunnel
``
##

## Execute additional batch on running container
``
docker exec -it stunnel /bin/bash
``
