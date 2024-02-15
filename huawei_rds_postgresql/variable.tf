# variable "project_name" {
#     type    = string
#     default = "test"
  
# }

variable "db_name" {
    type    = string
    default = "terraform_test_rds_instance"
}

variable "region" {
    type    = string
    default = "ap-southeast-3"
}

variable "flavor" {
    type    = string
    default = "rds.pg.n1.medium.2"
}


variable "is_high_available" {
    type  = bool
}


variable "ha_replication_mode" {
    type    = string
    default = "async"
}


variable "param_group_id" {
    type = string
  
}

variable "vpc_id" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "secgroup_id" {
    type = string
}

variable "availability_zone" {
    type = list(string)
  
}


variable "time_zone" {
    type    = string
    default = "UTC+08:00"
}

variable "charging_mode" {
    type    = string
    default = "postPaid"
}

variable "period_unit" {
    type    = string
    default = "month"
  
}

variable "period" {
    type    = number
    default = 1
}

variable "auto_renew" {
    type    = string
    default = "false"
}

variable "description" {
    type    = string
    default = "terraform-test-instance"
  
}

variable "maintain_begin" {
    type    = string
    default = "18:00" 
}

variable "maintain_end" {
    type    = string
    default = "22:00"
}

variable "db_type" {
    type    = string
    default = "PostgreSQL" //MySQL, PostgreSQL, SQLServer and MariaDB.
}

variable "db_version" {
    type    = string
    default = "14"
}

variable "postgreSQL_password" {
    type = string
  
}

variable "volume_type" {
    type    = string
    default = "CLOUDSSD"  //ULTRAHIGH,LOCALSSD,CLOUDSSD,ESSD
}

variable "volume_size" {
    type    = number
    default = 100
}

variable "volume_kms_id" {
    type = string
  
}

# variable "volume_trigger_threshold" {
#     type    = number
#     default = 10
# }

variable "backup_strategy_start_time" {
    type    = string
    default = "20:00-21:00"
  
}

variable "backup_strategy_keep_days" {
    type    = number
    default = 1
  
}

variable "backup_strategy_period" {
    type    = string
    default = "1,2,3,4,5,6,7"
  
}

variable "db_parameters" {
    type = list(object({
      name = string
      value = string
    }))

    default = null
}

variable "is_audit_enabled" {
    type = bool
    default = false
}

