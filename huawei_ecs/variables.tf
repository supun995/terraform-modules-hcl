variable "ecs_name" {
    type = string
}

variable "ecs_region" {
    type = string
}

variable "ecs_charging_mode" {
    type = string
    default = "postPaid"
}

variable "ecs_period_unit" {
    type = string 
    default = "month"
}

variable "ecs_period" {
    type = number
    default = 1
}

variable "ecs_auto_renew" {
    type = bool
    default = false
}

variable "ecs_instance_image_id" {
    type = string
    default =null
}

variable "ecs_instance_flavor_id" {
    type = string
}

variable "ecs_secgroup_id" {
    type = list(string)
  
}

variable "ecs_availability_zone" {
    type = string
  
}

variable "login_method" {
    type = string
    default = "PASS"
}

variable "ecs_admin_pass" {
    type = string
}

variable "ecs_key_pair" {
    type = string
    default = ""
  
}

variable "ecs_description" {
    type = string
  
}

variable "ecs_hostname" {
    type = string
    default = null
  
}

variable "ecs_system_disk_type" {
    type = string
    default = "GPSSD"
  
}

variable "ecs_system_disk_size" {
    type = number
    default = 40
  
}

variable "ecs_system_disk_iops" {
    type = number
    default = 3000
  
}

variable "ecs_system_disk_throughput" {
    type = number
    default = 0
  
}

variable "ecs_system_disk_kms_key_id" {
    type = string
    default = null
  
}

variable "is_disk_encryption_enabled" {
    type = bool
    default = false
}

variable "ecs_data_disks" {
    type = list(object({
      type = string
      size = number
      snapshot_id = optional(string, null)
      kms_key_id = optional(string, null)
      iops = optional(number, null)
      throughput = optional(number, null)
    }))

    default = [ {
      type = "GPSSD"
      size = 10
    } ]
  
}

variable "ecs_delete_disks_on_termination" {
    type = bool
    default = true
  
}

variable "ecs_network_uuid" {
    type = string

}

variable "ecs_network_fixed_ipv4" {
    type = string
    default = null
  
}

variable "auto_assign_eip_enabled" {
    type = bool
    default = false
  
}

variable "ecs_eip_type" {
    type = string
    default = "5_bgp"
}


variable "ecs_eip_bandwidth" {
    type = list(object({
        size        = number
        share_type  = string
        charge_mode = string
        id          = optional(string, null)
    }))
    default = [ {
        size        = 1
        share_type  = "PER"
        charge_mode = "traffic"
    } ]
}


variable "ecs_eip_id" {
    type = string
    default = null
  
}

variable "ecs_user_data" {
    type = string
    default = null
}

variable "ecs_image_name" {
    type = string
    default = "Ubuntu 18.04 server 64bit"
  
}

variable "ecs_ipv6_enable" {
    type = bool
    default = false
  
}

variable "ecs_source_dest_check" {
    type = bool
    default = true
  
}

variable "ecs_access_network" {
    type = bool
    default = false
  
}

variable "ecs_agent_list" {
    type = string
    default = null
}

variable "ecs_auto_terminate_time" {
    type = string
    default = null
  
}

variable "ecs_user_id" {
    type = string
    default = null
  
}

variable "ecs_spot_maximum_price" {
    type = string
    default = null
  
}

variable "ecs_spot_duration" {
    type = number
    default = null 
}

variable "ecs_spot_duration_count" {
    type    = number
    default = null 
  
}

variable "ecs_agency_name" {
    type = string
    default = null
  
}



