resource "aws_dynamodb_table" "dynamodb_table" {
  name              = var.project_name
  hash_key          = "todo_id"
  billing_mode      = "PROVISIONED"
  read_capacity     = var.readCapacity
  write_capacity    = var.writeCapacity

  vpc_configuration {
    subnet_ids = aws_db_subnet_group.subnet-rds.subnet_ids
  }

  attribute {
    name = "todo_id"
    type = "S"
  }
}