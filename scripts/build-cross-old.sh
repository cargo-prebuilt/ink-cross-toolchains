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

mkdir -p /tmp/build
pushd /tmp/build

git clone --depth=1 -b "$CROSSTOOLNG_VERSION" https://github.com/crosstool-ng/crosstool-ng

pushd ./crosstool-ng

./bootstrap
./configure --prefix=/usr

make -j`nproc`
make install

popd
rm -rf ./crosstool-ng

mv /.config .
ct-ng olddefconfig
ct-ng build

# Package
pushd /tmp/toolchain

tar -czvf "$CROSS_TOOLCHAIN".tar.gz .

mkdir -p /export
mv *.tar.gz /export
#mv /export/*.tar.gz /export/export.tar.gz

popd
popd
