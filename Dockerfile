FROM ubuntu:focal

# Get build dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN cp /etc/apt/sources.list /etc/apt/sources.list~ && \
        sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
        apt-get update && apt-get build-dep linux-image-$(uname -r) -y \
    && rm -rf /var/lib/apt/lists/* ;

RUN apt-get update && apt-get install -y \
        linux-headers-$(uname -r) \
        flex \
        bison \
        libssl-dev \
        bc \
        libelf-dev \
        libncurses-dev \
    && rm -rf /var/lib/apt/lists/* ;

# VOLUME /boot /boot
# VOLUME . /linux

WORKDIR /linux
ENTRYPOINT ./entrypoint.sh
# RUN cp /boot/config-$(uname -r) .config

# Clean kernel source dir
# ADD entrypoint.sh /entrypoint.sh
# RUN /entrypoint.sh --clean

# Build kernel
# ARG BUILD_LABEL
# ENV BUILD_LABEL=$BUILD_LABEL

