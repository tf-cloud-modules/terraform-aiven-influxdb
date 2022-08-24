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