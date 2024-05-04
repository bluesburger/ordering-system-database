resource "aws_dynamodb_table" "dynamodb_table" {
  name              = var.projectName
  hash_key         = "todo_id"
  billing_mode      = "PROVISIONED"
  read_capacity     = var.readCapacity
  write_capacity    = var.writeCapacity
  vpc_security_group_ids = ["${aws_security_group.sg-dynamo.id}"]
  db_subnet_group_name = aws_db_subnet_group.subnet-rds.id
  attribute {
    name = "todo_id"
    type = "S"
  }
}