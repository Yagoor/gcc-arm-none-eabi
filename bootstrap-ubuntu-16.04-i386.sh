#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install software-properties-common
apt-get -f install -y \
         build-essential autoconf autogen bison dejagnu flex flip \
         gawk git gperf gzip nsis openssh-client p7zip-full perl \
         python-dev libisl-dev scons tcl texinfo tofrodos wget zip \
         texlive texlive-extra-utils libncurses5-dev