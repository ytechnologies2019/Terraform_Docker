module "grafana_image" {
  source = "./grafana_module/"
}

# resource "docker_volume" "grafana_volume" {
#   name = join ("-", [terraform.workspace , "grafana-vol"])
# }

resource "docker_container" "grafana" {
  image = module.grafana_image.grafana_image_out
  name  = join ("-", [terraform.workspace , module.grafana_image.container_name])
  volumes {
    container_path = module.grafana_image.mount_path
    volume_name   = docker_volume.grafana_vol.name
  }
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

resource "docker_volume" "grafana_vol" {
  name = join ("-", [terraform.workspace , "grafana-vol"])
  lifecycle {
    prevent_destroy = true
  }
}