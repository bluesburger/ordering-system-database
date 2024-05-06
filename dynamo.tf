resource "aws_dynamodb_table" "dynamodb_table" {
  name              = var.project_name
  hash_key          = "paymentId"
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

  global_secondary_index {
    name               = "orderId-index"
    hash_key           = "orderId"
    projection_type    = "ALL"  # Pode ser ALL, KEYS_ONLY ou INCLUDE
    read_capacity      = var.readCapacity
    write_capacity     = var.writeCapacity

    # Define as colunas de índice
    non_key_attributes = ["additional_attribute"]

    # Define o schema da chave do índice
    provisioned_throughput {
      read_capacity_units  = var.readCapacity
      write_capacity_units = var.writeCapacity
    }
  }
}