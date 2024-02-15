# Huawei Cloud functionGraph
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

## How to use the Module

module "huawei_fgs" {
    providers = {
      huaweicloud.aps = huaweicloud.aps
    }

    source            = "./modules/huawei_fgs"

    function_name     = var.function_name 
    region            = var.region    
    handler           = var.handler
    memory_size       = var.memory_size 
    timeout           = var.timeout    
    runtime           = var.runtime  
    code_type         = var.code_type  
    func_code         = filebase64("${path.module}/templates/index.py")
    description       = var.description 
}


## Resources

| Name | Type |
|------|------|
| [huaweicloud_fgs_function.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/fgs_function) | resource |
