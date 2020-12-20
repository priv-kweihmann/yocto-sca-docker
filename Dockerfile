FROM ubuntu:18.04

# Does prevent interactive questions on apt operations
ENV DEBIAN_FRONTEND=noninteractive
ENV WORKSPACE=/opt/build
# Set en_US as default lang
ENV LANG=en_US.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        chrpath \
        cpio \
        debianutils \
        diffstat \
        file \
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
        sudo \
        texinfo \
        unzip \
        wget \
        xterm \
        xz-utils && \
    python3 -m pip install -U pip && \
    pip3 install pygments github3.py && \
    /usr/sbin/locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -U -m -s /bin/bash yoctouser && \
    mkdir -p ${WORKSPACE} && \
    chown -R yoctouser:yoctouser ${WORKSPACE} && \
    adduser yoctouser root && \
    adduser yoctouser sudo && \
    echo 'yoctouser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER yoctouser

CMD []
ENTRYPOINT ["/bin/bash"]
