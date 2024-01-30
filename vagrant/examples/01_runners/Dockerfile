# Use the latest Ubuntu LTS as our foundational image
FROM ubuntu:latest

# All apt commands should run in an non interactive mode
ENV DEBIAN_FRONTEND=noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN \
apt update; \
apt install -y --no-install-recommends \
    ca-certificates gnupg lsb-release locales wget curl sudo; \
locale-gen $LANG; \
update-locale LANG=$LANG; \
apt upgrade -y; apt clean autoclean; apt autoremove -y;

RUN \
apt update; \
apt install -y texlive-xetex; \
apt upgrade -y; apt clean autoclean; apt autoremove -y;
