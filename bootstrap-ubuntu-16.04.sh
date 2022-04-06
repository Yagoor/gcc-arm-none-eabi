#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

dpkg --add-architecture i386

apt-get update
apt-get install software-properties-common
add-apt-repository universe
cat >/etc/apt/sources.list.d/xenial.list <<EOF
deb http://archive.ubuntu.com/ubuntu xenial main universe
deb-src http://archive.ubuntu.com/ubuntu xenial main universe
deb http://security.ubuntu.com/ubuntu xenial-security main
EOF
echo ’APT::Default-Release "xenial";’ > /etc/apt/apt.conf.d/00default

apt-get install -y -t xenial \
         gcc-mingw-w64-i686 g++-mingw-w64-i686 binutils-mingw-w64-i686

apt-get -f install -y \
         build-essential autoconf autogen bison dejagnu flex flip \
         gawk git gperf gzip nsis openssh-client p7zip-full perl \
         python-dev libisl-dev scons tcl texinfo tofrodos wget zip \
         texlive texlive-extra-utils libncurses5-dev