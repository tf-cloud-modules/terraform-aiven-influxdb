resource "aiven_influxdb" "this" {
  count                   = var.create ? 1 : 0
  cloud_name              = var.cloud_name
  maintenance_window_dow  = var.maintenance_window_dow
  maintenance_window_time = var.maintenance_window_time
  plan                    = var.plan
  project                 = var.project
  project_vpc_id          = var.project_vpc_id
  static_ips              = var.static_ips
  service_name            = var.service_name
  termination_protection  = var.termination_protection

  influxdb_user_config {
    custom_domain            = var.custom_domain
    ip_filter                = var.ip_filter
    project_to_fork_from     = var.project_to_fork_from
    recovery_basebackup_name = var.recovery_basebackup_name
    service_to_fork_from     = var.service_to_fork_from
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key   = lookup(tag.value, "key", null)
      value = lookup(tag.value, "value", null)
    }
  }
}