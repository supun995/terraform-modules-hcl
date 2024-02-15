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
    default = "rds.mysql.n1.large.2"
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

variable "ssl_enable" {
    type = bool
    default = false
  
}

variable "lower_case_table_names" {
    type = string
    default = "1"
}

variable "db_type" {
    type    = string
    default = "MySQL" //MySQL, PostgreSQL, SQLServer and MariaDB.
}

variable "db_version" {
    type    = string
    default = "8.0"
}

variable "mysql_password" {
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

# variable "volume_limit_size" {
#     type = number
  
# }

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

variable "is_mysql_audit_enabled" {
    type = bool
    default = false
}

variable "sql_audit_keep_days" {
    type = number
    default = 0
}

#######################################

variable "rds_mysql_accounts" {
  type = list(object({
    account_name = string
    password     = string
    hosts        = list(string)
    description  = string
  }))
  default = [ {
    account_name = "terraform-user-2"
    password = "xOOCAPC8p3tgb9xC2ghg"
    hosts = ["%"]
    description = "terraform-user"
  },{
    account_name = "terraform-user-3"
    password = "xOOCAPC8p3tgb9xC2ghg"
    hosts = ["%"]
    description = "terraform-user"    
  }]

}

variable "databases" {
  type = list(string)
  default = [ "terraform" ]
}


variable "database_privilege" {
  type = list(object({
    db_name = string
    users   = list(object({
      name     = string
      readonly = bool
    }))
  }))
  default = [
    {
      db_name = "terraform"
      users = [
        { name = "terraform-user-2", readonly = true },
        { name = "terraform-user-3", readonly = false },
      ]
    }
  ]
}


variable "is_read_replica_enabled" {
    type = bool
    default = false
}

variable "read_replica_name" {
    type = string
    default = ""
}

variable "Replica_availability_zone" {
    type = string
}

variable "read_replica_flavor" {
    type = string
}

variable "audit_logs_keep_days" {
    type = number
    default = 5 
}

variable "mysql_audit_types" {
  type = list(string)
  default = ["CREATE_USER", "DROP_USER", "RENAME_USER", "GRANT", "REVOKE", "CREATE", "ALTER", "DROP", "RENAME", "TRUNCATE", "INSERT", "DELETE", "UPDATE"]
}