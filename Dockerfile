FROM ubuntu:18.04

# Does prevent interactive questions on apt operations
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        chrpath \
        cpio \
        debianutils \
        diffstat \
        gawk \
        gcc-multilib \
        git-core \
        glib-2.0-dev \
        iputils-ping \
        libegl1-mesa \
        libsdl1.2-dev \
        locales \
        pylint3 \
        python \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-pip \
        socat \
        texinfo \
        unzip \
        wget \
        xterm \
        xz-utils && \
    python3 -m pip install -U pip && \
    pip3 install pygments jsonmerge && \
    useradd -U -m yoctouser && \
    /usr/sbin/locale-gen en_US.UTF-8 && \
    mkdir -p /opt/build && \
    rm -rf /var/lib/apt/lists/*

USER yoctouser
WORKDIR /opt/build
CMD /bin/bash