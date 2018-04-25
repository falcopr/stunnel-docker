FROM debian:buster

LABEL Maintainer="Falco Prescher"
LABEL Github="https://github.com/falcoprescher/stunnel-docker"
LABEL Version="v1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Package cleanup and language setup
RUN apt-get clean && \
    apt-get update

RUN apt-get install sudo stunnel4 openssl -y

ADD ./setup.sh /setup.sh
ADD ./start.sh /start.sh
ADD ./stunnel.conf /etc/stunnel/stunnel.conf
RUN chmod +x /*.sh
RUN chown -R stunnel:stunnel /etc/stunnel

RUN adduser --disabled-password --gecos '' stunnel

USER stunnel

EXPOSE 443
CMD ["/start.sh"]
