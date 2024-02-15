variable "function_name" {
    type = string
}

variable "region" {
    type = string
}

variable "app" {
    type = string
    default = "default"
}

variable "handler" {
    type = string
}

variable "memory_size" {
    type = number
    default = 128
}

variable "timeout" {
    type = number
}

variable "runtime" {
    type = string
}

variable "code_type" {
    type = string
}

variable "func_code" {
    type = string
}

variable "depend_list" {
    type = list(string)
    default = null
  
}

variable "agency" {
    type = string
    default = null
}

variable "vpc_id" {
    type = string
    default = null
}

variable "network_id" {
    type = string
    default = null
}

variable "description" {
    type = string
}

variable "log_group_id" {
    type = string
    default = null
}

variable "log_stream_id" {
    type = string
    default = null
}

variable "log_group_name" {
    type = string
    default = null
}

variable "log_stream_name" {
    type = string
    default = null
}