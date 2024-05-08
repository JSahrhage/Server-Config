FROM ubuntu:24.04

RUN rm -rf /var/lib/dpkg/lock-frontend && \
    rm -rf /var/lib/dpkg/lock && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get install wget gpg tmux -y && \
    wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/Release.key | gpg --dearmor | tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./" | tee /etc/apt/sources.list.d/onedrive.list && \
    apt-get update && \
    apt install --no-install-recommends --no-install-suggests onedrive -y
