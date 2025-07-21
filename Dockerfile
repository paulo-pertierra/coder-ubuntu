FROM codercom/enterprise-base:ubuntu

USER root

RUN sudo apt-get update

RUN sudo apt-get install -y curl git \
sudo \
vim \
wget \
nodejs \
npm \
zsh \
nano \
fontconfig \
psmisc \
lsof \
net-tools \
nmap \
tcpdump \
iftop \
htop \
&& sudo rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/bin/node || true

RUN git config --global init.defaultBranch main

RUN chsh -s /bin/zsh root

COPY dotfiles/ /dotfiles/

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh