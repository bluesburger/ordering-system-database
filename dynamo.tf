resource "aws_dynamodb_table" "dynamodb_table" {
  name              = var.project_name
  hash_key          = "paymentId"
  range_key         = "orderId"  # Adicione a chave de classificação aqui
  billing_mode      = "PROVISIONED"
  read_capacity     = var.readCapacity
  write_capacity    = var.writeCapacity

  tags = {
    Subnet1 = aws_subnet.cluster-vpc-subnet-private-1.id,
    Subnet2 = aws_subnet.cluster-vpc-subnet-private-2.id
  }

  attribute {
    name = "paymentId"
    type = "S"
  }

  attribute {
    name = "orderId"
    type = "S"
  }

  global_secondary_index {
    name               = "orderId-index"
    hash_key           = "orderId"
    projection_type    = "ALL"
    read_capacity      = var.readCapacity
    write_capacity     = var.writeCapacity
  }
}
