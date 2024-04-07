#!/bin/bash

set -euxo pipefail

mkdir -p /tmp/build
pushd /tmp/build

mv /.config .
cat /.cconfig >> ./.config

ct-ng olddefconfig
ct-ng build

popd
rm -rf /tmp/build
