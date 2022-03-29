terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "docker" {
  name         = "docker:latest"
  build={
    path="../"
    tag=["docker_terraform:latest"]
  }
}

resource "docker_container" "docker_terraform" {
  image = docker_image.docker_terraform.latest
  name  = "docker_terraform"
  ports {
    internal = 80
    external = 8000
  }
}