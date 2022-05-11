FROM ubuntu:20.04

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget unzip screen htop gpg
# install box64
RUN wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && \
    wget -O - https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor | tee /usr/share/keyrings/box64-debs-archive-keyring.gpg && \
    apt update && apt install box64 -y


# setup steam user
RUN useradd -m bedrockserver
WORKDIR /home/bedrockserver
# USER bedrockserver
# ENTRYPOINT [ "/bin/sh" ]
CMD ["/bin/bash"]