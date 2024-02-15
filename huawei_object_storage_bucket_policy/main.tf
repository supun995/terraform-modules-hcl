resource "huaweicloud_obs_bucket_policy" "s3_policy" {
  provider      = huaweicloud.aps
  bucket        = var.bucket_id
  policy_format = var.bucket_policy_format
  policy        = var.bucket_policy 
}