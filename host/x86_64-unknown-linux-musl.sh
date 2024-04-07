#!/bin/bash

set -euxo pipefail

docker buildx build --progress=plain \
    -f docker/.Dockerfile \
    -t ink-toolchain:dev \
    --build-arg RUST_TARGET=x86_64-unknown-linux-musl \
    --build-arg CROSS_TOOLCHAIN=x86_64-linux-musl \
    .
