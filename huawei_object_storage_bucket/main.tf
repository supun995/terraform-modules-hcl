resource "huaweicloud_obs_bucket" "bucket" {
  provider       = huaweicloud.aps
  bucket         = var.bucket_name
  region         = var.region
  acl            = var.bucket_acl
  versioning     = var.bucket_versioning
  encryption     = var.bucket_encryption
  storage_class  = var.bucket_storage_class
  force_destroy  = var.bucket_force_destroy
  multi_az       = var.bucket_multi_az

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      name    = lifecycle_rule.value.name
      prefix  = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled

      expiration {
        days = lifecycle_rule.value.expiration
      }

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition_1 != null ? [lifecycle_rule.value.transition_1] : []

        content {
          days           = transition.value.days
          storage_class  = transition.value.storage_class
        }
      }

      dynamic "transition" {
        for_each = lifecycle_rule.value.transition_2 != null ? [lifecycle_rule.value.transition_2] : []

        content {
          days           = transition.value.days
          storage_class  = transition.value.storage_class
        }
      }

      abort_incomplete_multipart_upload {
        days = lifecycle_rule.value.incomplete_multipart_upload_days
      }
    }
    
  }

  dynamic "lifecycle_rule" {
    for_each = var.bucket_versioning? [var.lifecycle_rule_noncurrent_version]:[]
    content {
      name    = lifecycle_rule.value.name
      prefix  = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled

      noncurrent_version_expiration {
        days  = lifecycle_rule.value.expiration
      }
      
      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transition_1 != null ? [lifecycle_rule.value.noncurrent_version_transition_1] : []

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transition_2 != null ? [lifecycle_rule.value.noncurrent_version_transition_2] : []

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

    }
  }

  dynamic "cors_rule" {
    for_each = var.bucket_cors
    content {
      allowed_origins = cors_rule.value.allowed_origins
      allowed_methods = cors_rule.value.allowed_methods
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  tags = {
    project = var.project_name
  }
}

