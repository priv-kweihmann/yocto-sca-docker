#!/bin/sh
set -e
docker build --no-cache -t privkweihmann/yocto-sca-minimal:2004 -f Dockerfile .
docker push privkweihmann/yocto-sca-minimal:2004