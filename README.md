# Docker container for meta-sca building

Based on ubuntu:18.04, this container does offer the bare minimum to compile yocto builds with [meta-sca](https://github.com/priv-kweihmann/meta-sca) enabled

## Usage

* Download container

```shell
docker pull privkweihmann/yocto-sca-minimal:latest
```

* Go to the prepared workspace

```shell
docker run -it -v $(pwd):/opt/build privkweihmann/yocto-sca-minimal:latest /bin/bash
```

* Do your bitbake setup as if you where working locally
  
