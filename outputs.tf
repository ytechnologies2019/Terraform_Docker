 output "grafana_info" {
  value = join ("->" , [docker_container.grafana.name , var.ext_port])
 }
 output "nodered_info" {
   value = join ("->" , [docker_container.nodered.name , var.nodered_ext_port])
 }
 output "influx_info" {
   value = join ("->" , [docker_container.nodered.name , var.influx_ext_port])
 }
