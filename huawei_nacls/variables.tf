variable "nacl_name" {
    type = string
}

variable "public_subnets" {
  type = list(string)
  default = null
}

variable "private_subnets" {
  type = list(string)
  default = null
}


variable "region" {
    type = string
  
}

variable "allow_internal_traffic" {
    type = bool
  
}

variable "vpc_cidr" {
  description = "Specifies the range of available subnets in the VPC"
  type        = string
}

variable "network_acl_rule_public" {
  type = map(object({
    type                   = string                  # inbound or outbound
    enabled                = optional(bool, true)    # Enabled status for the network ACL rule
    protocol               = optional(string, "any") # Valid values are: tcp, udp, icmp and any.
    action                 = string                  # Currently, the value can be allow or deny.
    ip_version             = optional(number, 4)     # Specifies the IP version - 4 or 6
    source_ip_address      = string                  # Specifies the source IP address that the traffic is allowed from
    source_port            = string                  # Specifies the destination port number or port number range
    destination_ip_address = string                  # Specifies the destination IP address to which the traffic is allowed
    destination_port       = string                  # Specifies the destination port number or port number range.
  }))
  default = null
}

variable "network_acl_rule_private" {
  type = map(object({
    type                   = string                  # inbound or outbound
    enabled                = optional(bool, true)    # Enabled status for the network ACL rule
    protocol               = optional(string, "any") # Valid values are: tcp, udp, icmp and any.
    action                 = string                  # Currently, the value can be allow or deny.
    ip_version             = optional(number, 4)     # Specifies the IP version - 4 or 6
    source_ip_address      = string                  # Specifies the source IP address that the traffic is allowed from
    source_port            = string                  # Specifies the destination port number or port number range
    destination_ip_address = string                  # Specifies the destination IP address to which the traffic is allowed
    destination_port       = string                  # Specifies the destination port number or port number range.
  }))
  default = null
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the VPC"
  type        = map(string)
  default     = {}
}
