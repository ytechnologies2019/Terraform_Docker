module "grafana_image" {
  source = "./grafana_module/"
}

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

#nodered
# Find the latest Ubuntu precise image.
module "nodered_image" {
  source = "./nodered_module"
}

resource "docker_container" "nodered" {
  name  = "nodered"
  image = module.nodered_image.nodered_image_out
    volumes {
    container_path = module.nodered_image.nodered_vol
    volume_name   = docker_volume.nodered_vol.name
  }
  ports {
    internal = var.nodered_int_port
    external = var.nodered_ext_port
  }
}
resource "docker_volume" "nodered_vol" {
  name = join ("-", [terraform.workspace , "nodered-vol"])
  lifecycle {
    prevent_destroy = true
  }
}

#influxdb
module "influx_image" {
  source = "./influxdb_module"
}
resource "docker_container" "influxdb" {
  name  = "influxdb"
  image = module.influx_image.influxdb_image_out
  volumes {
    container_path = module.influx_image.influx_vol
    volume_name   = docker_volume.influx_vol.name
  }
  ports {
    internal = var.influx_int_port
    external = var.influx_ext_port
  }
}
resource "docker_volume" "influx_vol" {
  name = join ("-", [terraform.workspace , "grafana-vol"])
  lifecycle {
    prevent_destroy = true
  }
}