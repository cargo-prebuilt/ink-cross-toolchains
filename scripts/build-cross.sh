#!/bin/bash

set -euxo pipefail

mkdir -p /tmp/build
pushd /tmp/build

mv /.config .
ct-ng olddefconfig
ct-ng build

# Package
#pushd /tmp/crosstoolchains
#
#tar -czvf "$CROSS_TOOLCHAIN".tar.gz .
#
#mkdir -p /export
#mv *.tar.gz /export
#mv /export/*.tar.gz /export/export.tar.gz

#popd
#rm -rf /tmp/crosstoolchains

popd
rm -rf /temp/build
