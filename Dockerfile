FROM debian:11.4-slim

LABEL MAINTAINER="monegim"

RUN apt-get update \
    && apt-get install -y gnupg software-properties-common curl \
    && curl https://apt.releases.hashicorp.com/gpg | \
            gpg --dearmor | \
            tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
