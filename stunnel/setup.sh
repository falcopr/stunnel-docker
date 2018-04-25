#!/bin/sh

cd /etc/stunnel
if ! [ -f stunnel.pem ]
then
    openssl req -x509 -nodes -newkey rsa:2048 -days 3650 -subj '/CN=stunnel' \
                -keyout stunnel.pem -out stunnel.pem
    chmod 600 stunnel.pem
fi
