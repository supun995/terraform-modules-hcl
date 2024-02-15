resource "huaweicloud_compute_instance" "compute_instance" {
  provider               = huaweicloud.aps


  name                   = var.ecs_name
  region                 = var.ecs_region

  charging_mode          = var.ecs_charging_mode
  period_unit            = var.ecs_charging_mode == "prePaid" ? var.ecs_period_unit : null
  period                 = var.ecs_charging_mode == "prePaid" ? var.ecs_period : null
  auto_renew             = var.ecs_charging_mode == "prePaid" ? var.ecs_auto_renew : null
  user_id                = var.ecs_charging_mode == "prePaid" && var.login_method == "KEY" ? var.ecs_user_id : null

  spot_maximum_price     = var.ecs_charging_mode == "spot" ? var.ecs_spot_maximum_price : null
  spot_duration          = var.ecs_charging_mode == "spot" ? var.ecs_spot_duration : null
  spot_duration_count    = var.ecs_charging_mode == "spot" ? var.ecs_spot_duration_count : null


  image_id               = var.ecs_image_name == null ? var.ecs_instance_image_id : null
  image_name             = var.ecs_image_name != null ? var.ecs_image_name : null
  flavor_id              = var.ecs_instance_flavor_id
  security_group_ids     = var.ecs_secgroup_id
  availability_zone      = var.ecs_availability_zone

  admin_pass             = var.login_method == "PASS" ? var.ecs_admin_pass : null
  key_pair               = var.login_method == "KEY" ? var.ecs_key_pair : null
  description            = var.ecs_description
  hostname               = var.ecs_hostname != null ? var.ecs_hostname : null


  system_disk_type       = var.ecs_system_disk_type
  system_disk_size       = var.ecs_system_disk_size
  system_disk_iops       = var.ecs_system_disk_type == "GPSSD2|ESSD2" ? var.ecs_system_disk_iops : null
  system_disk_throughput = var.ecs_system_disk_type == "GPSSD2" ? var.ecs_system_disk_throughput : null
  system_disk_kms_key_id = var.is_disk_encryption_enabled ? var.ecs_system_disk_kms_key_id : null

  dynamic "data_disks" {
    for_each = var.ecs_data_disks != null ? toset(var.ecs_data_disks) : []

    content {
        type             = data_disks.value.type
        size             = data_disks.value.size
        kms_key_id       = var.is_disk_encryption_enabled ? var.ecs_system_disk_kms_key_id : null
        iops             = data_disks.value.iops != null ? data_disks.value.iops : null
        throughput       = data_disks.value.throughput  != null ? data_disks.value.throughput  : null

    }
    
  }

  delete_disks_on_termination = var.ecs_delete_disks_on_termination

  network {
    uuid                 = var.ecs_network_uuid
    fixed_ip_v4          = var.ecs_network_fixed_ipv4 != null ? var.ecs_network_fixed_ipv4 : null
    ipv6_enable          = var.ecs_ipv6_enable != null ? var.ecs_ipv6_enable : null
    source_dest_check    = var.ecs_source_dest_check
    access_network       = var.ecs_access_network

  }

  eip_type               = var.auto_assign_eip_enabled ? var.ecs_eip_type : null

  dynamic "bandwidth" {
    for_each             = var.auto_assign_eip_enabled ? toset(var.ecs_eip_bandwidth) : []

    content {
        size             = bandwidth.value.size
        share_type       = bandwidth.value.share_type
        charge_mode      = bandwidth.value.charge_mode
    }
    
  }

  eip_id = var.ecs_eip_id != null ? var.ecs_eip_id : null

  user_data              = var.ecs_user_data != null ? var.ecs_user_data : null

  agency_name            = var.ecs_agency_name != null ? var.ecs_agency_name : null

  agent_list             = var.ecs_agent_list

  auto_terminate_time    = var.ecs_auto_terminate_time

}
