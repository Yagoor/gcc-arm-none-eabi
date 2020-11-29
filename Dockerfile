FROM i386/ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# Set user for what comes next
USER root

RUN apt-get -qq update && \
  apt-get -qq -y --no-install-recommends install \
    build-essential \
    autoconf \
    autogen \
    bison \
    dejagnu \
    flex \
    flip \
    gawk \
    git \
    gperf \
    gzip \
    nsis \
    openssh-client \
    p7zip-full \
    perl \
    python-dev \
    libisl-dev \
    scons \
    tcl \
    texinfo \
    tofrodos \
    wget \
    zip \
    texlive \
    texlive-extra-utils \
    libncurses5-dev \
    ca-certificates \
    > /dev/null \
  && apt-get -qq clean

# Create user, enable X forwarding, add to group dialout
# -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/user && \
    echo "user:x:${uid}:${gid}:user,,,:/home/user:/bin/bash" >> /etc/passwd && \
    echo "user:x:${uid}:" >> /etc/group && \
    echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chown ${uid}:${gid} -R /home/user && \
    usermod -aG dialout user

# Set user for what comes next
USER user

# Environment variables
ENV HOME /home/user

# Working directory
WORKDIR ${HOME}

# Start a bash
CMD bash --login
