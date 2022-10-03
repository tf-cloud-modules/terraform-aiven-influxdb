# Complete Aiven InfluxDB Cluster

Configuration in this directory creates an Aiven InfluxDB cluster with following features:

- Aiven InfluxDB Cluster

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_database"></a> [database](#module\_database) | ../../modules/database | n/a |
| <a name="module_influxdb"></a> [influxdb](#module\_influxdb) | ../.. | n/a |
| <a name="module_user"></a> [user](#module\_user) | ../../modules/user | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->