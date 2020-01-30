#!/bin/sh
set -e
docker build -t privkweihmann/yocto-sca-minimal:latest -f Dockerfile .
docker push privkweihmann/yocto-sca-minimal:latest