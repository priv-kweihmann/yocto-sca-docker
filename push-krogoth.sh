#!/bin/sh
set -e
docker build --no-cache -t privkweihmann/yocto-sca-minimal:krogoth -f Dockerfile.krogoth .
docker push privkweihmann/yocto-sca-minimal:krogoth