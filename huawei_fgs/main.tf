resource "huaweicloud_fgs_function" "fgs" {
  provider        = huaweicloud.aps

  name            = var.function_name
  region          = var.region
  app             = var.app
  handler         = var.handler
  memory_size     = var.memory_size
  timeout         = var.timeout  
  runtime         = var.runtime
  code_type       = var.code_type 
  func_code       = var.func_code
  depend_list     = var.depend_list 

  agency          = var.agency 
  vpc_id          = var.vpc_id  
  network_id      = var.network_id

  description     = var.description 

  log_group_id    = var.log_group_id
  log_stream_id   = var.log_stream_id
  log_group_name  = var.log_group_name
  log_stream_name = var.log_stream_name

}