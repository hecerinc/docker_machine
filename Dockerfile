# syntax=docker/dockerfile:1
FROM debian:bullseye
RUN apt update && apt install -y curl git sudo zsh ripgrep fd-find binutils fzf vim
RUN useradd -ms /usr/bin/zsh -G sudo hector -p "$(openssl passwd -1 hector)"
USER hector
WORKDIR /home/hector
COPY init.sh ./
SHELL ["/bin/bash", "--login", "-c"]

RUN ./init.sh
EXPOSE 9000


