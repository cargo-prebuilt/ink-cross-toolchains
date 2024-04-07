#!/bin/bash

set -euxo pipefail

docker buildx build --progress=plain \
    -f docker/.Dockerfile \
    -t ink-toolchain:dev \
    --build-arg RUST_TARGET=aarch64-unknown-linux-musl \
    --build-arg CROSS_TOOLCHAIN=aarch64-linux-musl \
    .
