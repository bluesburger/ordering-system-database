output "subnet1_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet1.id
}

output "subnet2_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet2.id
}

output "subnet3_id" {
  description = "ID da Subnet criada na AWS"
  value       = aws_subnet.subnet3.id
}

output "security_group" {
  description = "ID da security Group criada na AWS"
  value       = aws_security_group.security_group.id
}
