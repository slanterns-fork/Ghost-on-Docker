FROM ubuntu:16.04
#Use Debian 9?
MAINTAINER slanterns <slanterns.w@gmail.com>

#upgrade packages
RUN apt update \
    && apt upgrade -y

#install node.js 6.x
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -        #From https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN apt install nodejs -y

#install ghost
WORKDIR /var/www/ghost
RUN apt install wget unzip -y
RUN wget https://ghost.org/zip/ghost-latest.zip \
    && unzip -uo ghost-latest.zip -d /var/www/ghost \
    && rm -f ghost-latest.zip
ENV GHOST_NODE_VERSION_CHECK false
RUN npm install --production





#install configurations
COPY config.js /usr/src/ghost/

EXPOSE 2368
CMD ["npm","start","--production"]
