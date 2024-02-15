resource "huaweicloud_dcs_instance" "dcs_instance" {
  provider           = huaweicloud.aps


  name               = var.dcs_instance_name
  region             = var.region

  charging_mode      = var.dcs_charging_mode
  period_unit        = var.dcs_charging_mode == "prePaid" ? var.dcs_period_unit : null
  period             = var.dcs_charging_mode == "prePaid" ? var.dcs_period_unit : null
  auto_renew         = var.dcs_charging_mode == "prePaid" ? var.dcs_auto_renew : null


  engine             = var.dcs_engine
  engine_version     = var.engine_version
  capacity           = var.dcs_capacity
  flavor             = var.dcs_flavor

  availability_zones = var.dcs_availability_zones
  vpc_id             = var.dcs_vpc_id
  subnet_id          = var.dcs_subnet_id
  security_group_id  = var.dcs_security_group_id
  template_id        = var.dcs_template_id

  port               = var.dcs_port
  password           = var.dcs_password
  whitelist_enable   = var.dcs_whitelist_enable

  access_user        = var.dcs_engine == "Memcached" ? var.dcs_access_user : null

  maintain_begin     = var.dcs_maintain_begin
  maintain_end       = var.dcs_maintain_end

  ##
  # security_group_id is not supported for Redis 4.0 and 5.0
  # please configure the whitelists alternatively
  ##


  dynamic "whitelists" {
    for_each = var.dcs_whitelists 
    content {
      group_name    = whitelists.key
      ip_address    = whitelists.value
    }
  }

  dynamic "backup_policy" {
    for_each = var.dcs_backup_policy != null? { 
    for k, v in var.dcs_backup_policy : k => v } : {}

    content {
        backup_type = each.value.backup_type
        save_days   = each.value.save_days
        backup_at   = each.value.backup_at
        begin_at    = each.value.begin_at
    }
    
  }

  dynamic "parameters" {
    for_each = var.dcs_parameters != null ? {
    for k, v in var.dcs_parameters : k => v } : {}

    content {
        id         = each.value.id
        name       = each.value.name
        value      = each.value.value
    }
    
  }

  description      = var.dcs_description

  tags             = var.tags
}