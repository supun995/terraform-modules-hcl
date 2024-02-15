variable "project_name" {
    description = "project name"
    type = string
    default = "test"
}

variable "bucket_name" {
    description = "specify the name of the object store"
    type        = string
    nullable    = false
}

variable "region" {
    description = "region bucket resides in"
    type        = string
    default     = "AP-Singapore"
}

variable "bucket_acl" {
    description = "bucket acl value"
    type = string
    default = "private"  // "private", "public-read", "public-read-write" and "log-delivery-write
    validation {
      condition     = contains(["private", "public-read", "public-read-write", "log-delivery-write"], var.bucket_acl)
      error_message = "The predefined common policies are as follows: 'private', 'public-read', 'public-read-write' and 'log-delivery-write'."
  }
}

variable "bucket_versioning" {
    description = "to enable versioning"
    type = bool
    default = false
}

variable "bucket_encryption" {
    description = "define server-side encryption"
    type = bool
    default = true
}

variable "bucket_storage_class" {
    description = "define initial storage class for objects"
    type = string
    default = "STANDARD" //storage classes: "STANDARD", "WARM" (Infrequent Access) and "COLD" (Archive). Defaults to STANDARD.
}

variable "bucket_force_destroy" {
    description = "enable to delete objects when tf destroy"
    type = bool
    default = true
}

variable "bucket_multi_az" {
    description = "define availabilty-zone config for bucket"
    type = bool
    default = false
}


variable "lifecycle_rules" {
    description = "set lifecyle policy for objects"
    type = list(object({
        name        = string
        prefix      = string
        enabled     = bool
        expiration  = number

        transition_1 = object({
          days = number
          storage_class = string
        })

        transition_2 = object({
          days = number
          storage_class = string
        })
        
        incomplete_multipart_upload_days = number
    }))
    default = null
}


variable "lifecycle_rule_noncurrent_version" {
    description = "set lifecyle policy for noncurrent objects"
    type = list(object({
        name        = string
        prefix      = string
        enabled     = bool
        expiration  = number
        noncurrent_version_transition_1= object({
          days = number
          storage_class = string
        })
        noncurrent_version_transition_2= object({
          days = number
          storage_class = string
        })
    }))
    default = null
}


variable "bucket_cors" {
  description = "cors configuraton for bucket"
  type = list(object({
    allowed_origins = list(string)
    allowed_methods = list(string)
    max_age_seconds = optional(number, 100)
  }))
  default = []
}


