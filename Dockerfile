FROM ubuntu:20.04

ENV USER dotfiles
ENV TERM xterm-256color
ENV DOTBOT_NO_UPDATE_REPO 1
ENV CI true

RUN apt-get update && \
  apt-get install -yq tzdata && \
  ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata
ENV TZ="America/New_York"

RUN apt -y update && apt -y install git openssl python3 sudo
RUN useradd -m -s /bin/bash -G sudo dotfiles
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER dotfiles
WORKDIR /home/dotfiles
COPY --chown=dotfiles:dotfiles . .

CMD "bash"
