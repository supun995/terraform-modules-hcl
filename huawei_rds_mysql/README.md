# Huawei Cloud RDS MYSQL
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

module "huaweicloud_rds_mysql_instance" {
    providers = {
      huaweicloud.aps = huaweicloud.aps
    }

    source                                = "./modules/huawei_rds_mysql"

    db_name                               = var.db_name 
    region                                = var.region
#########---UPDATE-BELOW-THREE-PARAMS-FOR-HA----#########################################
    flavor                                = var.flavor
    is_high_available                     = var.is_high_available
    availability_zone                     = var.availability_zone
#########################################################################################
    vpc_id                                = var.vpc_id 
    subnet_id                             = var.subnet_id 
    secgroup_id                           = var.secgroup_id

    param_group_id                        = var.param_group_id
    time_zone                             = var.time_zone 
    charging_mode                         = var.charging_mode 
    description                           = var.description 

    maintain_begin                        = var.maintain_begin 
    maintain_end                          = var.maintain_end   

    db_type                               = var.db_type 
    db_version                            = var.db_version  
    mysql_password                        = var.mysql_password  
    volume_type                           = var.volume_type 
    volume_size                           = var.volume_size 
    volume_kms_id                         = var.volume_kms_id   
    backup_strategy_start_time            = var.backup_strategy_start_time 
    backup_strategy_keep_days             = var.backup_strategy_keep_days 
    db_parameters                         = var.db_parameters 
    rds_mysql_accounts                    = var.rds_mysql_accounts     
    databases                             = var.databases
    database_privilege                    = var.database_privilege 
    is_read_replica_enabled               = var.is_read_replica_enabled 
    read_replica_name                     = var.read_replica_name
    Replica_availability_zone             = var.Replica_availability_zone 
    read_replica_flavor                   = var.read_replica_flavor
    is_mysql_audit_enabled                = var.is_mysql_audit_enabled 
    audit_logs_keep_days                  = var.audit_logs_keep_days 
    mysql_audit_types                     = var.mysql_audit_types 
}


## Resources

| Name | Type |
|------|------|
| [huaweicloud_rds_instance.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/rds_instance) | resource |
