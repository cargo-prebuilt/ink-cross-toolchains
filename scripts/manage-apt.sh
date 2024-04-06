#!/bin/bash

set -euxo pipefail

apt update
apt upgrade -y
apt install -y \
    gcc \
    g++ \
    gperf \
    bison \
    flex \
    texinfo \
    help2man \
    make \
    libncurses5-dev \
    python3-dev \
    autoconf \
    automake \
    libtool \
    libtool-bin \
    gawk \
    wget \
    bzip2 \
    xz-utils \
    unzip \
    patch \
    libstdc++6 \
    rsync \
    git \
    meson \
    ninja-build

apt install -y \
    g++-aarch64-linux-gnu \
    g++-x86-64-linux-gnu

rm -rf /var/lib/apt/lists/*
