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
        iproute2 \
        iputils-ping \
        jq \
        libegl1-mesa \
        liblz4-tool \
        libsdl1.2-dev \
        locales \
        pylint3 \
        python \
        python3 \
        python3-dev \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-pip \
        socat \
        ssh \
        sudo \
        texinfo \
        uml-utilities \
        unzip \
        wget \
        xterm \
        xz-utils \
        zstd && \
    apt remove -y python3-wrapt && \
    python3 -m pip install -U pip && \
    pip3 install pygments github3.py github3.py python-git oelint-parser scancode-toolkit semantic-version && \
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
