FROM ubuntu:16.04
#Use Debian 9?
MAINTAINER slanterns <slanterns.w@gmail.com>

#upgrade packages
RUN apt update \
    && apt upgrade -y

#install node.js 6.x
RUN apt install curl sudo wget -y
#RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -        #From https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
#try using nvm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash  #upgradable
RUN nvm ls-remote && nvm install v6.3.1 && nvm use v6.3.1 #upgradable

#install ghost
WORKDIR /var/www/ghost
RUN apt install unzip sqlite3 -y
RUN wget https://ghost.org/zip/ghost-0.9.0.zip \                 #upgradable  
    && unzip -uo ghost-0.9.0.zip -d /var/www/ghost \
    && rm -f ghost-latest.zip
ENV GHOST_NODE_VERSION_CHECK false
RUN npm install --production





#install configurations
COPY config.js /usr/src/ghost/

EXPOSE 2368
CMD ["npm","start","--production"]
