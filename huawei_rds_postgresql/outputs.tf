output "instance_id" {
    value = huaweicloud_rds_instance.postgresql_instance.id
}

output "instance_private_ip" {
    value = huaweicloud_rds_instance.postgresql_instance.private_ips
}