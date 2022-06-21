FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

ARG USER
ARG UID
ARG GID
ARG GROUP

ENV USER=${USER}
ENV UID=${UID}
ENV GID=${GID}
ENV GROUP=${GROUP}

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
        tigervnc-standalone-server \
        tigervnc-xorg-extension \
        tigervnc-viewer

RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN addgroup "${GROUP}" --gid "${GID}"
RUN useradd -d /home/${USER} -u "${UID}" -g "${GID}" "${USER}"&& mkdir -p /home/${USER}
RUN chown -R "${USER}:${USER}" /home/${USER}
RUN "${USER}:${USER}" | chpasswd
RUN echo "$USER ALL=(root) NOPASSWD: /usr/bin/ansible-playbook *" >> /etc/sudoers

RUN echo "export USER=${USER}" >> /etc/bash.bashrc
RUN echo "export UID=${UID}" >> /etc/bash.bashrc
RUN echo "export GID=${GID}" >> /etc/bash.bashrc
RUN echo "export GROUP=${GROUP}" >> /etc/bash.bashrc

RUN mkdir -p /opt/flutter
RUN chown -R "${USER}" /opt/flutter
RUN chmod -R 777 /opt/flutter
RUN echo "export PATH=/flutter:/opt/flutter/bin:${PATH}" >> /etc/bash.bashrc

WORKDIR /flutter
ENV HOME "/home/${USER}"

ENTRYPOINT [ "/flutter/docker/entrypoint" ]
