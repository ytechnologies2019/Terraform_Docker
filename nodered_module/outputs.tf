output "nodered_image_out" {
  value = docker_image.nodered.name
}

output "nodered_vol" {
  value = var.nodered_vol
}