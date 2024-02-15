# Huawei Cloud OBS
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [bucket_name](#input\_name) | Specifies the name of the Object Store | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the resource. If omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_acl"></a> [bucket\_acl](#input\_acl) | Specifies the ACL policy for a bucket | `string` | `"private"` | no |
| <a name="input_versioning"></a> [bucket\_versioning](#input\_versioning) | Whether enable versioning | `string` | `false` | no |
| <a name="input_encryption"></a> [bucket\_encryption](#input\_encryption) | Whether enable server-side encryption | `string` | `true` | no |
| <a name="input_storage_class"></a> [bucket\_storage\_class](#input\_storage\_class) | Specifies the storage class of the bucket | `string` | `"STANDARD"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket, so that the bucket can be destroyed without error | `bool` | `false` | no |
| <a name="input_multiAZ"></a> [bucket\_multi\_az](#input\_multiAZ) | Whether enable multi-AZ | `string` | `false` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | A configuration of object lifecycle management:<br><br>  * `key` - Unique identifier for lifecycle rules, the Rule Name contains a maximum of 255 characters;<br>  * `enabled` - Specifies lifecycle rule status;<br>  * `prefix`  - Object key prefix identifying one or more objects to which the rule applies. If omitted, all objects in<br>    the bucket will be managed by the lifecycle rule;<br>  * `expiration` - Specifies the number of days when objects that have been last updated are automatically deleted.;<br>  * `transition_1` - Specifies transition status.take inputs days and storage_class;<br>  * `transition_2` - Specifies 2nd transition; | <pre>map(object({<br>    enabled         = optional(bool, true)<br>    prefix          = optional(string, null)<br>    expiration_days = number<br>    transition_1  = object({<br>      days         = number<br>      storage_class         = string<br>  })<br> incomplete_multipart_upload_days        = number<br>}))</pre> | `{}` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | A configuration of object CORS rules:<br><br>  * `allowed_origins` - Requests from this origin can access the bucket;<br>  * `allowed_methods` - Specifies the acceptable operation type of buckets and objects;<br>  * `max_age_seconds` - Specifies the duration that your browser can cache CORS responses, expressed in seconds; | <pre>list(object({<br>    allowed_origins = list(string)<br>    allowed_methods = list(string)<br>    max_age_seconds = optional(number, 100)<br>  }))</pre> | `[]` | no |
| <a name="input_policy_format"></a> [policy\_format](#input\_policy\_format) | Specifies the policy format, the supported values are obs and s3. Defaults to obs | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies the key/value pairs to associate with the OBS | `map(string)` | `{}` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [bucket_id](#output\_id) | The name of the bucket |
<!-- END_TF_DOCS -->