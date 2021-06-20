docker-meshcommander
====================

Dockerized MeshCommander.

Source repository
-----------------

[![Build and push image](https://github.com/bendwyer/docker-meshcommander/actions/workflows/build_and_push_image.yml/badge.svg)](https://github.com/bendwyer/docker-meshcommander/actions/workflows/build_and_push_image.yml)

[bendwyer/docker-meshcommander](https://github.com/bendwyer/docker-meshcommander)

Build
-----

This image is built using [Packer](https://www.packer.io/).

### Automated build

GitHub Actions are leveraged to build and push new versions of the `docker-meshcommander` image to Docker Hub. New builds are triggered either by new tagged releases on GitHub or an update to the MeshCommander npm package version.

### Manual build

Check for the [latest version](https://www.npmjs.com/package/meshcommander?activeTab=versions) of MeshCommander and add that to the `packer build` command.

```bash
packer build -var='meshcommander_version=0.9.0-d' -var='docker_tags=["latest"]' .
```

Run
-----

### `docker run`

```bash
# Restricted to your local machine
docker run -d -p 127.0.0.1:3000:3000 bendwyer/docker-meshcommander:latest

OR 

# Accessible over the network
docker run -d -p 3000:3000 bendwyer/docker-meshcommander:latest
```

### `docker compose`

```bash
version: "3.7"
services:
  meshcommander:
    image: bendwyer/docker-meshcommander:latest
    container_name: meshcommander
    restart: always
    ports:
    # choose one of the following
      # - 127.0.0.1:3000:3000
      # - 3000:3000
```

```bash
# Start
docker compose up -d

# Stop
docker compose down
```

Access
------

127.0.0.1:3000 ---> `localhost`:3000

3000:3000 ---> `computer_ip_address`:3000

Credit
------
- https://github.com/vga101/meshcommander
- https://www.npmjs.com/package/meshcommander
