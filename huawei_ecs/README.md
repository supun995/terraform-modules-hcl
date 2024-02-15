# The Terraform module of HUAWEI Cloud ECS service

The terraform module for one-click deployment of ECS instance.

## Usage

module "huawei_ecs_instance" {
    providers = {
                  huaweicloud.aps = huaweicloud.aps
    }

    source                          = "./modules/huawei_ecs"
    ecs_name                        = var.ecs_name  
    ecs_region                      = var.ecs_region

    ecs_charging_mode               = var.ecs_charging_mode
    
    ecs_image_name                  = var.ecs_image_name
    ecs_instance_flavor_id          = var.ecs_instance_flavor_id
    ecs_secgroup_id                 = var.ecs_secgroup_id
    ecs_availability_zone           = var.ecs_availability_zone 

    login_method                    = var.login_method
    ecs_admin_pass                  = var.ecs_admin_pass 
    ecs_description                 = var.ecs_description   
 
    ecs_system_disk_type            = var.ecs_system_disk_type 
    ecs_system_disk_size            = var.ecs_system_disk_size

    is_disk_encryption_enabled      = var.is_disk_encryption_enabled

    ecs_data_disks                  = var.ecs_data_disks

    ecs_delete_disks_on_termination = var.ecs_delete_disks_on_termination
    ecs_network_uuid                = var.ecs_network_uuid  
    auto_assign_eip_enabled         = var.auto_assign_eip_enabled
    ecs_agent_list                  = var.ecs_agent_list
}

```

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.40.0 |

## Resources

| Name | Type |
|------|------|
| huaweicloud_compute_instance.this | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| ecs_charging_mode | The charging mode of the ECS resources | string | null | N |
| period_unit | The period unit of the pre-paid purchase | string | null | N |
| period | The period number of the pre-paid purchase | number | null | N |
| is_auto_renew | Whether to automatically renew after expiration for ECS resources | bool | null | N |
| ecs_name | The name of the ECS instance | string | null | N |
| ecs_instance_image_name | The name of the IMS image that ECS instance used | string | null | N |
| ecs_instance_flavor_id | The ID of the ECS instance flavor | string | null | N |
| ecs_secgroup_id | The ID list of the security groups to which the ECS instance belongs | list(string) | [] | N |
| ecs_availability_zone | The specified availability zone where the ECS instance is located | string | null | N |
| login_method | The specified login method valid values "PASS","KEY" | string | null | N |
| ecs_admin_pass | The specified admin password | string | null | N |
| ecs_description | The specified description for instance | string | null | N |
| system_disk_type | The type of the system volume | string | "SSD" | N |
| system_disk_size | The size of the system volume, in GB | number | 40 | N |
| is_disk_encryption_enabled | The enable encryption | bool | false | N |
| data_disks_configuration | The configuration of data disks of the ECS instance | list(object({<br>  type        = optional(string, "SSD")<br>  size        = optional(number, 100)<br>  snapshot_id = optional(string, null)<br>  kms_key_id  = optional(string, null)<br>  iops        = optional(string, null)<br>  throughput  = optional(string, null)<br>})) | [{<br>  type = "SSD"<br>  size = 200<br>}] | N |
| delete_disks_on_termination | Whether to delete the data disks when the instance is terminated | bool | true | N |
| ecs_network_uuid | The subnet id | string | null | N |

## Outputs

| Name | Description |
|------|-------------|

| instance_id | The ID of the first ECS instance |
