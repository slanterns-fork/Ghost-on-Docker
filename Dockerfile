FROM ubuntu:16.04
#Debian 9?
MAINTAINER slanterns <slanterns.w@gmail.com>


#upgrade
RUN apt update \
    && apt upgrade -y


