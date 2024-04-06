# syntax=docker/dockerfile:1
FROM debian:12-slim as builder

# Versioning
ARG CROSSTOOLNG_VERSION=crosstool-ng-1.26.0

# Do not set
ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETARCH

ARG RUST_TARGET
ARG CROSS_TOOLCHAIN

RUN --mount=type=bind,source=./scripts/manage-apt.sh,target=/run.sh /run.sh

RUN --mount=type=bind,source=./scripts/build-crosstool.sh,target=/run.sh /run.sh

COPY ./config/${RUST_TARGET}.config /.config
ARG CCONFIG=""
COPY ./cconfig/${CCONFIG}.config /.cconfig
RUN --mount=type=bind,source=./scripts/build-cross.sh,target=/run.sh /run.sh

RUN --mount=type=bind,source=./scripts/package.sh,target=/run.sh /run.sh

FROM scratch

WORKDIR /export

COPY --from=builder /export/*.tar.gz .
