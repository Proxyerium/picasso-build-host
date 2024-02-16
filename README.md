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
