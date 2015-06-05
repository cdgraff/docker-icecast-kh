# Icecast-kh Dockerfile

This repository contains a Dockerfile to build a Docker Image with Icecast-kh version 2.4.0

[![Build Status](https://travis-ci.org/zokeber/docker-icecast-kh.svg?branch=master)](https://travis-ci.org/zokeber/docker-icecast-kh)

## Base Docker Image

* [zokeber/centos](https://registry.hub.docker.com/u/zokeber/centos/)

## Usage

### Installation

1. Install [Docker](https://www.docker.com/).

2. You can download automated build from public Docker Hub Registry:

```
docker pull zokeber/icecast-kh:latest
```

**Another way: build from Github**

To create the image zokeber/icecast-kh, clone this repository and execute the following command on the docker-centos folder:

`docker build -t zokeber/icecast-kh:latest .`

Another alternatively, you can build an image directly from Github:

`docker build -t="zokeber/icecast-kh:latest" github.com/zokeber/docker-icecast-kh`


### Create and running a container

**Create container:**

```
docker create -it --name container-icecast-kh -h icecast-kh zokeber/icecast-kh
```

**Start container:**

```
docker start container-icecast-kh
```


### Connection methods:

**Bash:**

`docker exec -it container-icecast-kh bash`


### Upgrading

Stop the currently running image:

```
docker stop container-icecast-kh
```


Update the docker image:

```
docker pull zokeber/icecast-kh:latest
```
