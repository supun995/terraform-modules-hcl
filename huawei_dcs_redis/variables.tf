variable "dcs_instance_name" {
    description = "Specifies the instance name"
    type        = string
}

variable "region" {
    description = "Specifies the region in which to create the resource, if omitted, the provider-level region will be used"
    type        = string
}

variable "dcs_charging_mode" {
    description = "Specifies the charging mode of the redis instance."
    type        = string
}


variable "dcs_period_unit" {
    description = "Specifies the charging period unit of the instance."
    type        = string
    default     = "month"
  
}

variable "dcs_period" {
    description = "Specifies the charging period of the instance."
    type        = number
    default     = 1
}

variable "dcs_auto_renew" {
    description = "pecifies whether auto renew is enabled."
    type        = string
    default     = "false"
}

variable "dcs_engine" {
    description = "Specifies a cache engine. Options: Redis and Memcached."
    type        = string
}

variable "engine_version" {
    description = "Specifies the version of a Redis engine"
    type        = string
}

variable "dcs_capacity" {
    description = "Specifies the cache capacity in GB"
    type        = number
    validation {
        condition     = contains([0.125, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 64], var.dcs_capacity)
        error_message = "Valid values are 0.125, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 64."
    }
}

variable "dcs_flavor" {
    type        = string
}

variable "dcs_availability_zones" {
    description = "Specifies the AZ name, if omitted, AZ calculates automatically"
    type        = list(string)
  
}

variable "dcs_vpc_id" {
    description = "Specifies the VPC ID"
    type        = string
}

variable "dcs_subnet_id" {
    description = "Specifies the network ID of a subnet"
    type        = string
}

variable "dcs_port" {
    description = "Specifies the Redis port"
    type        = number
    default     = 6379
  
}

variable "dcs_security_group_id" {
    description = "The ID of the security group which the instance belongs to."
    type        = string
    default     = null
}

variable "dcs_template_id" {
    description = "The Parameter Template ID. Changing this creates a new instance resource."
    type        = string
    default     = null
}

variable "dcs_password" {
  description   = <<DES
  Specifies the password of a DCS instance. Changing this creates a new instance.
  The password of a DCS instance must meet the following complexity requirements:

  * Must be a string of 8 to 32 bits in length;
  * Must contain three combinations of the following four characters: Lower case
    letters, uppercase letter, digital, Special characters include (`~!@#$^&*()-_=+\|{}:,<.>/?);
  * The new password cannot be the same as the old password.
  DES
    type      = string
}

variable "dcs_whitelists" {
    description = "Specifies the IP addresses which can access the instance"
    type        = map(list(string))
    default     = {}
}

variable "dcs_whitelist_enable" {
    description = "Enable or disable the IP address whitelists"
    type        = bool
    default     = null
  
}

variable "dcs_maintain_begin" {
    description = "Time at which the maintenance time window starts."
    type        = string
}

variable "dcs_maintain_end" {
    description = "Time at which the maintenance time window ends."
    type        = string
}

variable "dcs_backup_policy" {
    type = map(object({
      backup_type = string
      save_days   = number
      backup_at   = list(number)
      begin_at    = string
    }))
    default       = null
}

variable "dcs_parameters" {
    type = map(object({
      id         = string
      name       = string
      value      = string
    }))
    default      = null
}

variable "dcs_access_user" {
    description = "Specifies the username used for accessing a DCS Memcached instance"
    type        = string
    default     = null
   
}

variable "dcs_description" {
    description = "Specifies the description of an instance"
    type        = string
  
}

variable "tags" {
  description  = "Specifies the key/value pairs to associate with the Redis Instance"
  type         = map(string)
  default      = {}
}

