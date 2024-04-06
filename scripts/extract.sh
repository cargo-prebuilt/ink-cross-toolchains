#!/bin/bash

set -euxo pipefail

ID="$(docker create --pull=never ink-toolchain:dev sh)"

docker cp "$ID":/export .

docker rm "$ID"
