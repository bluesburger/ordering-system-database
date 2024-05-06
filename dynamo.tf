resource "aws_dynamodb_table" "dynamodb_table" {
  name              = var.project_name
  hash_key          = "todo_id"
  billing_mode      = "PROVISIONED"
  read_capacity     = var.readCapacity
  write_capacity    = var.writeCapacity

  tags = {
    Subnet1 = aws_subnet.cluster-vpc-subnet-private-1.id,
    Subnet2 = aws_subnet.cluster-vpc-subnet-private-2.id
  }

  attribute {
    name = "todo_id"
    type = "S"
  }
}