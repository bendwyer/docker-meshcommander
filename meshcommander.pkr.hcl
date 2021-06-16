packer {
  required_plugins {
    docker = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "meshcommander" {
  image  = "node:current-alpine"
  commit = true
  changes = [
    "CMD [\"meshcommander\",\"--any\"] ",
    "ENTRYPOINT [\"node\"]",
    "EXPOSE 3000",
    "USER node",
    "WORKDIR /meshcommander/node_modules/meshcommander"
  ]
}

build {
  source "source.docker.meshcommander" {
  }
  provisioner "shell" {
    inline = [
      "mkdir /meshcommander",
      "cd /meshcommander",
      "npm install meshcommander@${var.meshcommander_version}"
    ]
  }
  post-processors {
    post-processor "docker-tag" {
      repository = "bendwyer/docker-meshcommander"
      tags = [
        "${var.meshcommander_version}"
      ]
    }
  }
}