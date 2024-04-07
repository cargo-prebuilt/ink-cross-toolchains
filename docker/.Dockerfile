# syntax=docker/dockerfile:1
FROM debian:12-slim as builder

# Versioning
ARG CROSSTOOLNG_VERSION=6ad7b969036afa80963df69cc7bc8ebfbc627cb9
ARG MUSL_VERSION=1.2.4
ARG ZLIB_VERSION=1.3.1

# Do not set
ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETARCH

ARG RUST_TARGET
ARG CROSS_TOOLCHAIN

#ARG CROSS_TOOLCHAIN_PREFIX="$CROSS_TOOLCHAIN"-
#ARG CROSS_SYSROOT=/tmp/toolchain/"$CROSS_TOOLCHAIN"

RUN --mount=type=bind,source=./scripts/manage-apt.sh,target=/run.sh /run.sh

RUN --mount=type=bind,source=./scripts/build-crosstool.sh,target=/run.sh /run.sh

COPY ./config/.config /.config
COPY ./config/${RUST_TARGET}.config /arch.config
ARG CCONFIG=""
COPY ./cconfig/${CCONFIG}.config /.cconfig
RUN --mount=type=bind,source=./scripts/build-cross.sh,target=/run.sh /run.sh

# TODO: Musl and zLib
# Would probably need a second Dockerfile due to arch diffs. 

RUN --mount=type=bind,source=./scripts/package.sh,target=/run.sh /run.sh

FROM scratch

WORKDIR /export

COPY --from=builder /export/*.tar.gz .
