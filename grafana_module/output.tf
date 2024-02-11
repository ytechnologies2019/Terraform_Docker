 output "grafana_image_out" {
  value = docker_image.grafana.name
 }

output "container_name" {
    value = var.grafana_name
}
output "mount_path" {
    value = var.mount_path
}