#!/bin/bash

set -euxo pipefail

# Package
pushd /usr

tar -czvf "$CROSS_TOOLCHAIN".tar.gz "$CROSS_TOOLCHAIN"

mkdir -p /export
mv "$CROSS_TOOLCHAIN".tar.gz /export

popd
