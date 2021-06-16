docker-meshcommander
====================
Dockerized MeshCommander.

Build
-----

Check for the latest version of MeshCommander: https://www.npmjs.com/package/meshcommander?activeTab=versions

    packer build -var "meshcommander_version=0.9.0-d" . 

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

Uncomment one of the `ports` options in `docker-compose.yml` and then run:

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