output "influxdb_image_out" {
  value = docker_image.influxdb.name
}

output "influx_vol" {
  value = var.container_path
}