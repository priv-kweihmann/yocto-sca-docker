#!/bin/bash
set -e

if [ -z "${WORKSPACE}" ]; then
  echo "Set the WORKSPACE environment variable."
  exit 1
fi

if [ ! -e ${WORKSPACE} ]; then
    mkdir -p ${WORKSPACE}
    echo "creating workspace"
fi
chmod -R g+w ${WORKSPACE}

useradd -U -m -s /bin/bash yoctouser > /dev/null
adduser yoctouser root > /dev/null

export HOME=/home/yoctouser

cd ${WORKSPACE}
exec gosu yoctouser $@
