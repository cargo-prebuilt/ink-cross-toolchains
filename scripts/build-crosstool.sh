#!/bin/bash

set -euxo pipefail

mkdir -p /tmp/buildcrosstool
pushd /tmp/buildcrosstool

git clone --depth=1 -b "$CROSSTOOLNG_VERSION" https://github.com/crosstool-ng/crosstool-ng

pushd ./crosstool-ng

./bootstrap
./configure --prefix=/usr

make -j`nproc`
make install

popd

popd
rm -rf /tmp/buildcrosstool
