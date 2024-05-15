output "public_subnet_sg_id" {
  value = aws_security_group.private_subnet_sg.id
}

output "security_group" {
  description = "ID da security Group criada na AWS"
  value       = aws_security_group.public_subnet_sg.id
}

output "rds_endpoint" {
  value = aws_db_instance.rdsorder.endpoint
  # sensitive = true
}

output "rds_aws_instance_identifier" {
  value     = aws_db_instance.rdsorder.identifier
  sensitive = true
}

output "rds_endpoint_menu" {
  value = aws_db_instance.rdsmenu.endpoint
  # sensitive = true
}

output "rds_aws_instance_identifier_menu" {
  value     = aws_db_instance.rdsmenu.identifier
  sensitive = true
}

