# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt install -y curl vim git sudo zsh
RUN useradd -ms /usr/bin/zsh -G sudo hector -p "$(openssl passwd -1 hector)"
USER hector
WORKDIR /home/hector
COPY init.sh ./
SHELL ["/bin/bash", "--login", "-c"]

RUN ./init.sh
EXPOSE 9000


