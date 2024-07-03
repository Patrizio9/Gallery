terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13"  # Sostituisci con la versione corretta del provider
    }
  }
}
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx_image" {
  name = "nginx:alpine"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.latest
  name  = "web-server"
  ports {
    internal = 80
    external = 8000
  }
  # Monta la directory html nel container
  volumes {
    host_path      = abspath("${path.module}/All")
    container_path = "/usr/share/nginx/html"
  }
}
