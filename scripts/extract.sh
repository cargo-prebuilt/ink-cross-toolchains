#!/bin/bash

set -euxo pipefail

if [ -z "${TARGETARCH+x}" ]; then
  case "$(uname -m)" in
  x86_64|amd64)
      export TARGETARCH=amd64
      ;;
  aarch64|arm64)
      export TARGETARCH=arm64
      ;;
  *)
      echo "Unsupported Arch: $TARGETARCH" && exit 1
      ;;
  esac
fi

ID="$(docker create --pull=never --platform=linux/"$TARGETARCH" ink-toolchain:dev sh)"

docker cp "$ID":/export .

docker rm "$ID"
