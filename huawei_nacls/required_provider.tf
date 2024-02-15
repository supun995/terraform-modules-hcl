terraform {

  # required_version = ">= 0.14"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.36.0"
      configuration_aliases = [ huaweicloud.aps ]
    }
  }
}

