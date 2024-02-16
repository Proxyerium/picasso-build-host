clone this repository firstly,

```sh
git clone https://github.com/Proxyerium/picasso-build-host.git
cd picasso-build-host
```

build docker image,

```sh
docker build -t picasso-build-host --rm .
```

startup a container

```sh
docker run -it picasso-build-host
```

and then clone the kernel sources from here: https://github.com/EndCredits/kernel_xiaomi_sm7250
