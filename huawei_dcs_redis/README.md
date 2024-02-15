# Huawei Cloud DCS Redis Single node
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## How to use the Module

module "dcs_redis" {
    providers = {
      huaweicloud.aps      = huaweicloud.aps
    }

    source                 = "./modules/huawei_dcs_redis"
    dcs_instance_name      = var.dcs_instance_name 
    region                 = var.region
    dcs_charging_mode      ="postPaid"
    dcs_engine             = var.dcs_charging_mode
    engine_version         = var.engine_version 
    dcs_capacity           = var.dcs_capacity 
    dcs_flavor             = var.dcs_flavor

    dcs_availability_zones = var.dcs_availability_zones
    dcs_vpc_id             = var.dcs_vpc_id
    dcs_subnet_id          = var.dcs_subnet_id

    dcs_password           = var.dcs_password

    dcs_maintain_begin     = var.dcs_maintain_begin
    dcs_maintain_end       = var.dcs_maintain_end

    dcs_description        = var.dcs_description
}

## Resources

| Name | Type |
|------|------|
| [huaweicloud_dcs_instance.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dcs_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [dcs\_availability\_zones](#input\_availability\_zones) | Specifies the AZ name, if omitted, AZ calculates automatically | `list(string)` | `[]` | no |
| <a name="input_capacity"></a> [dcs\_capacity](#input\_capacity) | Specifies the cache capacity in GB | `number` | `0.5` | no |
| <a name="input_description"></a> [dcs\_description](#input\_description) | Specifies the description of an instance | `string` | `null` | no |
| <a name="input_engine_version"></a> [dcs\_engine\_version](#input\_engine\_version) | Specifies the version of a Redis engine | `string` | `"5.0"` | no |
| <a name="input_name"></a> [dcs\_name](#input\_name) | Specifies the instance name | `string` | n/a | yes |
| <a name="input_password"></a> [dcs\_password](#input\_password) | Specifies the password of a DCS instance. Changing this creates a new instance.<br>  The password of a DCS instance must meet the following complexity requirements:<br><br>  * Must be a string of 8 to 32 bits in length;<br>  * Must contain three combinations of the following four characters: Lower case<br>    letters, uppercase letter, digital, Special characters include (`~!@#$^&*()-_=+\|{}:,<.>/?);<br>  * The new password cannot be the same as the old password.<br>` | `string` | `null` | no |
| <a name="input_port"></a> [dcs\_port](#input\_port) | Specifies the Redis port | `number` | `6379` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the resource, if omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_subnet_id"></a> [dcs\_subnet\_id](#input\_subnet\_id) | Specifies the network ID of a subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [dcs\_tags](#input\_tags) | Specifies the key/value pairs to associate with the Redis Instance | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [dcs\_vpc\_id](#input\_vpc\_id) | Specifies the VPC ID | `string` | n/a | yes |
| <a name="input_whitelist"></a> [dcs\_whitelist](#input\_whitelist) | Specifies the IP addresses which can access the instance | `map(list(string))` | `{}` | no |
| <a name="input_whitelist_enable"></a> [dcs\_whitelist\_enable](#input\_whitelist\_enable) | Enable or disable the IP address whitelists | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [dcs_instance_id](#output\_id) | A resource ID in UUID format |

<!-- END_TF_DOCS -->