resource "huaweicloud_network_acl" "nacl_public" {
  provider              = huaweicloud.aps
  count                 = var.public_subnets != null ? 1 : 0
  region                = var.region
  name                  = format("%s-public-nacl", var.nacl_name)
  subnets               = var.public_subnets
  inbound_rules         = [for rule in huaweicloud_network_acl_rule.public_inbound : rule.id]
  outbound_rules        = [for rule in huaweicloud_network_acl_rule.public_outbound : rule.id]
}

resource "huaweicloud_network_acl_rule" "public_inbound" {
  provider              = huaweicloud.aps

  for_each = var.network_acl_rule_public != null ? {
    for k, v in var.network_acl_rule_public : k => v if v.type == "inbound"
  } : {}

  region                 = var.region
  name                   = each.key
  enabled                = each.value.enabled
  protocol               = each.value.protocol
  action                 = each.value.action
  ip_version             = each.value.ip_version
  source_ip_address      = each.value.source_ip_address
  source_port            = each.value.source_port
  destination_ip_address = each.value.destination_ip_address
  destination_port       = each.value.destination_port
}

resource "huaweicloud_network_acl_rule" "public_outbound" {
  provider              = huaweicloud.aps


  for_each = var.network_acl_rule_public != null ? {
    for k, v in var.network_acl_rule_public : k => v if v.type == "outbound"
  } : {}

  region         = var.region
  name                   = each.key
  enabled                = each.value.enabled
  protocol               = each.value.protocol
  action                 = each.value.action
  ip_version             = each.value.ip_version
  source_ip_address      = each.value.source_ip_address
  source_port            = each.value.source_port
  destination_ip_address = each.value.destination_ip_address
  destination_port       = each.value.destination_port
}

resource "huaweicloud_network_acl" "private" {
  provider               = huaweicloud.aps
  count                  = var.private_subnets != null ? 1 : 0
  region                 = var.region
  name                   = format("%s-private-nacl", var.nacl_name)
  subnets                = var.private_subnets
  inbound_rules          = concat(
    huaweicloud_network_acl_rule.private_inbound_default.*.id,
    [for rule in huaweicloud_network_acl_rule.private_inbound : rule.id]
  )
  outbound_rules         = concat(
    huaweicloud_network_acl_rule.private_outbound_default.*.id,
    [for rule in huaweicloud_network_acl_rule.private_outbound : rule.id]
  )
}

resource "huaweicloud_network_acl_rule" "private_outbound_default" {
  provider               = huaweicloud.aps

  count                  = var.allow_internal_traffic ? 1 : 0

  region                 = var.region
  name                   = "default"
  description            = "Default ACL Rule allows traffic inside of VPC"
  protocol               = "any"
  action                 = "allow"
  ip_version             = 4
  source_ip_address      = var.vpc_cidr
  destination_ip_address = var.vpc_cidr
}

resource "huaweicloud_network_acl_rule" "private_inbound_default" {
  provider               = huaweicloud.aps

  count                  = var.allow_internal_traffic ? 1 : 0

  region                 = var.region
  name                   = "default"
  description            = "Default ACL Rule allows traffic inside of VPC"
  protocol               = "any"
  action                 = "allow"
  ip_version             = 4
  source_ip_address      = var.vpc_cidr
  destination_ip_address = var.vpc_cidr
}

resource "huaweicloud_network_acl_rule" "private_outbound" {
  provider               = huaweicloud.aps

  for_each               = var.network_acl_rule_private != null ? {
    for k, v in var.network_acl_rule_private : k => v if v.type == "outbound"
  } : {}

  region                 = var.region
  name                   = each.key
  enabled                = each.value.enabled
  protocol               = each.value.protocol
  action                 = each.value.action
  ip_version             = each.value.ip_version
  source_ip_address      = each.value.source_ip_address
  source_port            = each.value.source_port
  destination_ip_address = each.value.destination_ip_address
  destination_port       = each.value.destination_port
}

resource "huaweicloud_network_acl_rule" "private_inbound" {
  provider              = huaweicloud.aps

  for_each = var.network_acl_rule_private != null ? {
    for k, v in var.network_acl_rule_private : k => v if v.type == "inbound"
  } : {}

  region                 = var.region
  name                   = each.key
  enabled                = each.value.enabled
  protocol               = each.value.protocol
  action                 = each.value.action
  ip_version             = each.value.ip_version
  source_ip_address      = each.value.source_ip_address
  source_port            = each.value.source_port
  destination_ip_address = each.value.destination_ip_address
  destination_port       = each.value.destination_port
}