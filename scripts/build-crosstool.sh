#!/bin/bash

set -euxo pipefail

mkdir -p /tmp/buildcrosstool
pushd /tmp/buildcrosstool

git clone https://github.com/crosstool-ng/crosstool-ng crosstool-ng
cd ./crosstool-ng

git reset --hard "$CROSSTOOLNG_VERSION"

./bootstrap
./configure --prefix=/usr

make -j`nproc`
make install

popd
rm -rf /tmp/buildcrosstool
