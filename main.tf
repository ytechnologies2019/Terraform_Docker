module "grafana_image" {
  source = "./grafana_module/"
}

resource "docker_container" "grafana" {
  image = module.grafana_image.grafana_image_out
  name  = join ("-", [terraform.workspace , module.grafana_image.container_name])
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}
