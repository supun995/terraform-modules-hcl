output "instance_id" {
    value = huaweicloud_rds_instance.mysql_instance.id
}

output "instance_private_ip" {
    value = huaweicloud_rds_instance.mysql_instance.private_ips
}