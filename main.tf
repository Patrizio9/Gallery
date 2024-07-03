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
  build {
    context    = abspath("${path.module}")
    dockerfile = abspath("${path.module}/Dockerfile")
  }
}
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.latest
  name  = "web_server"
  ports {
    internal = 80
    external = 80
  }
  # Monta la directory contenente i tuoi file nel container
  volumes {
    host_path      = abspath("${path.module}/DC")
    container_path = "/usr/share/nginx/Gallery/DC"
  }
  volumes {
    host_path      = abspath("${path.module}/FantasySwords")
    container_path = "/usr/share/nginx/Gallery/FantasySwords"
  }
  volumes {
    host_path      = abspath("${path.module}/MISC")
    container_path = "/usr/share/nginx/Gallery/Misc"
  }
  volumes {
    host_path      = abspath("${path.module}/Sonic")
    container_path = "/usr/share/nginx/Gallery/Sonic"
  }
  volumes {
    host_path      = abspath("${path.module}/WorldOfHeroes")
    container_path = "/usr/share/nginx/Gallery/WorldOfHeroes"
  }
}
