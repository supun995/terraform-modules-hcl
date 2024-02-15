resource "huaweicloud_rds_instance" "mysql_instance" {
  provider               = huaweicloud.aps

  name                   = var.db_name
  region                 = var.region

  flavor                 = var.flavor
  ha_replication_mode    = var.is_high_available ? var.ha_replication_mode : null
  availability_zone      = var.availability_zone

  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  security_group_id      = var.secgroup_id

  param_group_id         = var.param_group_id
  time_zone              = var.time_zone

  charging_mode          = var.charging_mode
  period_unit            = var.charging_mode == "prePaid" ? var.period_unit : null
  period                 = var.charging_mode == "prePaid" ? var.period_unit : null
  auto_renew             = var.charging_mode == "prePaid" ? var.auto_renew : null

  description            = var.description
  maintain_begin         = var.maintain_begin
  maintain_end           = var.maintain_end

  ssl_enable             = var.ssl_enable 
  lower_case_table_names = var.lower_case_table_names

  db {
    type     = var.db_type
    version  = var.db_version
    password = var.mysql_password
  }

  volume {
    type               = var.volume_type
    size               = var.volume_size
    disk_encryption_id = var.volume_kms_id
    # limit_size         = var.volume_limit_size
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

resource "huaweicloud_rds_mysql_database" "rds_mysql_database" {
  provider      = huaweicloud.aps

  for_each      = toset(var.databases)

  instance_id   = huaweicloud_rds_instance.mysql_instance.id
  name          = each.value
  character_set = "utf8"
  description   = "test database"
}


resource "huaweicloud_rds_mysql_account" "rds_mysql_account" {
  provider      = huaweicloud.aps


  for_each      = { for db in var.rds_mysql_accounts : db.account_name => db }

  instance_id = huaweicloud_rds_instance.mysql_instance.id
  name        = each.value.account_name
  password    = each.value.password
  hosts       = each.value.hosts
  description = each.value.description
}


resource "huaweicloud_rds_mysql_database_privilege" "database_privilege" {
  provider               = huaweicloud.aps


  for_each = { for db in var.database_privilege : db.db_name => db }

  instance_id = huaweicloud_rds_instance.mysql_instance.id
  db_name     = each.value.db_name

  dynamic "users" {
    for_each = each.value.users

    content {
      name     = users.value.name
      readonly = users.value.readonly
    }
  }
}

resource "huaweicloud_rds_read_replica_instance" "replica_instance" {
  provider               = huaweicloud.aps


  count               = var.is_read_replica_enabled ? 1 : 0
  name                = var.read_replica_name
  flavor              = var.read_replica_flavor
  primary_instance_id = huaweicloud_rds_instance.mysql_instance.id
  availability_zone   = var.Replica_availability_zone
  security_group_id   = var.secgroup_id

  volume {
    type              = var.volume_type
    size              = var.volume_size
  }
}


resource "huaweicloud_rds_sql_audit" "rds_sql_audit" {
  provider            = huaweicloud.aps


  count               = var.is_mysql_audit_enabled ? 1 : 0
  instance_id         = huaweicloud_rds_instance.mysql_instance.id
  keep_days           = var.audit_logs_keep_days
  audit_types         = var.mysql_audit_types
}