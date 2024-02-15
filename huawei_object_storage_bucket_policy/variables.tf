variable "bucket_policy" {
  description    = "Policy document for OBS bucket"
  type           = string
  default        = ""
}


variable "bucket_id" {
    type         = string
}

variable "bucket_policy_format" {
    description  = "bucket policy format s3 or obs"
    type         = string
    default      = "obs"
}