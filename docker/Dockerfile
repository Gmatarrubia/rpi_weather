FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt -y update && \
    apt install -y --no-install-recommends \
        locales \
        git \
        ansible \
        rsync \
        grep \
        bash \
        xz-utils \
        curl \
        wget \
        fakeroot \
        gawk \
        zip \
        unzip \
        tar \
        sudo \
        pseudo \
        cpio \
        file \
        build-essential \
        xxd \
        socat \
        python3 \
        python3-dev \
        python3-pip \
        kmod \
        bc \
        clang \
        cmake \
        ninja-build \
        pkg-config \
        libgtk-3-dev \
        liblzma-dev \
        tightvncserver

RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

WORKDIR /flutter
ENV HOME /flutter

ENTRYPOINT [ "/flutter/docker/entrypoint" ]
