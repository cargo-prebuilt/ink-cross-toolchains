#!/bin/bash

set -euxo pipefail

mkdir -p /tmp/zlib
pushd /tmp/zlib

git clone --depth=1 -b v"$ZLIB_VERSION" https://github.com/madler/zlib.git zlib
cd ./zlib

CROSS_COMPILE="$CROSS_TOOLCHAIN_PREFIX" CC="$CROSS_TOOLCHAIN_PREFIX"gcc AR="$CROSS_TOOLCHAIN_PREFIX"ar \
    ./configure --prefix="$CROSS_SYSROOT" --static

make "-j$(nproc)"
make "-j$(nproc)" install

popd
rm -rf /tmp/zlib
