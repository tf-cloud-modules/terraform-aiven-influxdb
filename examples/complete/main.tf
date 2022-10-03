module "influxdb" {
  source       = "../.."
  project      = var.project
  service_name = "test"
  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

module "database" {
  source        = "../../modules/database"
  project       = module.influxdb.project
  service_name  = module.influxdb.service_name
  database_name = "test"
}

module "user" {
  source       = "../../modules/user"
  project      = module.influxdb.project
  service_name = module.influxdb.service_name
  username     = "test"
}