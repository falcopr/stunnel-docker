FROM debian:buster

LABEL Maintainer="Falco Prescher"
LABEL Github="https://github.com/falcoprescher/stunnel-docker"
LABEL Version="v1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Package cleanup and language setup
RUN apt-get clean && \
    apt-get update

RUN apt-get install openssh-server pwgen sudo -y
RUN mkdir -p /var/run/sshd 
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
#RUN sed -i "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN touch /root/.Xauthority

ADD ./stunnel/setup.sh /setup.sh
ADD ./stunnel/start.sh /start.sh
RUN chmod +x /*.sh

RUN useradd docker \
        && passwd -d docker \
        && mkdir /home/docker \
        && chown docker:docker /home/docker \
        && addgroup docker staff \
        && addgroup docker sudo

EXPOSE 22
CMD ["/start.sh"]
