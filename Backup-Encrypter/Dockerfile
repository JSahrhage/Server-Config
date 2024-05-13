FROM ubuntu:24.04

RUN rm -rf /var/lib/dpkg/lock-frontend && \
    rm -rf /var/lib/dpkg/lock && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get install cron gpg -y
