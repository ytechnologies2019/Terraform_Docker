 output "grafana_info" {
  value = join ("->" , [docker_container.grafana.name , var.ext_port])
 }
