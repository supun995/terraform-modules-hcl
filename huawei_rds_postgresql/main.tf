resource "huaweicloud_rds_instance" "postgresql_instance" {
  provider            = huaweicloud.aps

  name                = var.db_name
  region              = var.region

  flavor              = var.flavor
  ha_replication_mode = var.is_high_available ? var.ha_replication_mode : null
  availability_zone   = var.availability_zone

  vpc_id              = var.vpc_id
  subnet_id           = var.subnet_id
  security_group_id   = var.secgroup_id

  param_group_id      = var.param_group_id
  time_zone           = var.time_zone

  charging_mode       = var.charging_mode
  period_unit         = var.charging_mode == "prePaid" ? var.period_unit : null
  period              = var.charging_mode == "prePaid" ? var.period_unit : null
  auto_renew          = var.charging_mode == "prePaid" ? var.auto_renew : null

  description         = var.description
  maintain_begin      = var.maintain_begin
  maintain_end        = var.maintain_end

  db {
    type     = var.db_type
    version  = var.db_version
    password = var.postgreSQL_password
  }

  volume {
    type               = var.volume_type
    size               = var.volume_size
    disk_encryption_id = var.volume_kms_id
    # trigger_threshold  = var.volume_trigger_threshold
  }

  backup_strategy {
    start_time = var.backup_strategy_start_time
    keep_days  = var.backup_strategy_keep_days
    period     = var.backup_strategy_period
  }

  dynamic "parameters" {
    for_each = var.db_parameters != null ? var.db_parameters : []
    content {
      name = parameters.value.name
      value= parameters.value.value
    }
  }

  # tags = {
  #   project = var.project_name
  # }

}

resource "huaweicloud_rds_pg_plugin" "pg_plugin" {
  provider      = huaweicloud.aps

  count         = var.is_audit_enabled ? 1: 0
  instance_id   = huaweicloud_rds_instance.instance.id
  database_name = "postgres"
  name          = "pgaudit"
}

