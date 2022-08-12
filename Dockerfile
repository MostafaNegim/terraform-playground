FROM debian:11.4-slim

LABEL MAINTAINER="monegim"

RUN apt-get update \
    && apt-get install -y gnupg software-properties-common \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        sudo tee /etc/apt/sources.list.d/hashicorp.list \
    && apt update \
    && apt-get install terraform

CMD [ "terraform", "-version"]

