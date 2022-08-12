FROM debian:11.4-slim

LABEL MAINTAINER="monegim"

RUN sudo apt-get update \
    && sudo apt-get install -y gnupg software-properties-common \
    && wget -O- https://apt.releases.hashicorp.com/gpg | \
            gpg --dearmor | \
            tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
