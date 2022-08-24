resource "aiven_influxdb_database" "this" {
  count                  = var.create ? 1 : 0
  project                = var.project
  service_name           = var.service_name
  database_name          = var.database_name
  termination_protection = var.termination_protection
}