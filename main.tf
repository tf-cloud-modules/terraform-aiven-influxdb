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
    project_to_fork_from     = var.project_to_fork_from
    recovery_basebackup_name = var.recovery_basebackup_name
    service_to_fork_from     = var.service_to_fork_from

    dynamic "ip_filter_object" {
      for_each = var.ip_filter_object
      content {
        network     = lookup(ip_filter_object.value, "network")
        description = lookup(ip_filter_object.value, "description", null)
      }
    }

    public_access {
      influxdb = var.public_access_influxdb
    }

    private_access {
      influxdb = var.private_access_influxdb
    }

    privatelink_access {
      influxdb = var.privatelink_influxdb
    }

    dynamic "influxdb" {
      for_each = var.influxdb_user_config
      content {
        log_queries_after    = lookup(influxdb.value, "log_queries_after", null)
        max_connection_limit = lookup(influxdb.value, "max_connection_limit", null)
        max_row_limit        = lookup(influxdb.value, "max_row_limit", null)
        max_select_buckets   = lookup(influxdb.value, "max_select_buckets", null)
        max_select_point     = lookup(influxdb.value, "max_select_point", null)
        query_timeout        = lookup(influxdb.value, "query_timeout", null)
      }
    }
  }

  dynamic "service_integrations" {
    for_each = var.service_integrations
    content {
      integration_type    = lookup(service_integrations.value, "integration_type", null)
      source_service_name = lookup(service_integrations.value, "source_service_name", null)
    }
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key   = lookup(tag.value, "key", null)
      value = lookup(tag.value, "value", null)
    }
  }
}