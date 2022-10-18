FROM ubuntu:20.04

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
        jq \
        libegl1-mesa \
        liblz4-tool \
        libsdl1.2-dev \
        locales \
        mesa-common-dev \
        python3 \
        python3-dev \
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
        zstd \
        && locale-gen ${LANG}
RUN apt remove -y python3-wrapt && \
    python3 -m pip install -U pip && \
    pip3 install --upgrade \
        github3.py \
        Jinja2 \
        oelint-parser \
        pexpect \
        pygments \
        pylint \
        python-git \
        python-subunit \
        scancode-toolkit \
        semantic-version \
    && rm -rf /var/lib/apt/lists/*

ENV uid 1001
ENV gid 1001

RUN useradd -u ${uid} -U -m -s /bin/bash yoctouser && \
    mkdir -p ${WORKSPACE} && \
    chown -R yoctouser:yoctouser ${WORKSPACE} && \
    adduser yoctouser root && \
    adduser yoctouser sudo && \
    echo 'yoctouser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER yoctouser

CMD []
ENTRYPOINT ["/bin/bash"]
