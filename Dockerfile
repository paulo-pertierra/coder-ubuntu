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

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ENV ZSH_CUSTOM=/root/.oh-my-zsh/custom

RUN git config --global init.defaultBranch main

RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

RUN chsh -s /bin/zsh root

COPY dotfiles/ /root/