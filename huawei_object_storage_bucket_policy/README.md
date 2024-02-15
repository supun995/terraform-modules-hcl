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
| <a name="input_name"></a> [bucket\_id](#input\_name) | Specifies the name of the Object Store | `string` | n/a | yes |
| <a name="input_policy_format"></a> [bucket\_policy\_format](#input\_policy\_format) | Specifies the policy format, the supported values are obs and s3. Defaults to obs | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Specifies the text of the bucket policy in JSON format. For more information about obs format bucket policy,<br>  see the Developer Guide https://support.huaweicloud.com/intl/en-us/perms-cfg-obs/obs_40_0004.html | `string` | `null` | no |


