module "influxdb" {
  source       = "../.."
  project      = "tf-cloud-modules"
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