# Docker container for meta-sca building

Based on ubuntu:22.04, this container does offer the bare minimum to compile yocto builds with [meta-sca](https://github.com/priv-kweihmann/meta-sca) enabled

## Usage

* Download container

```shell
docker pull privkweihmann/yocto-sca-minimal:2204
```

* Go to the prepared workspace

```shell
docker run -it -v $(pwd):/opt/build privkweihmann/yocto-sca-minimal:2204
```

* Do your bitbake setup as if you where working locally

### Define another workdir

Instead of `/opt/build` you can define any directory to be used as the workdir - just run

```shell
docker run -it -v $(pwd):/opt/build privkweihmann/yocto-sca-minimal:2204
```