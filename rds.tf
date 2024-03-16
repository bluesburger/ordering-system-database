resource "aws_db_instance" "rds" {
  db_name                      = var.projectName
  engine                       = var.engineRds
  engine_version               = var.engineRdsVersion
  identifier                   = "rds-${var.projectName}"
  username                     = var.TF_VAR_AWS_RDS_USER
  password                     = var.TF_VAR_AWS_RDS_PASS
  instance_class               = var.instanceClass
  storage_type                 = var.storageType
  allocated_storage            = var.minStorage
  max_allocated_storage        = var.maxStorage
  multi_az                     = false
  vpc_security_group_ids       = ["${aws_security_group.sg-rds.id}"]
  db_subnet_group_name         = aws_db_subnet_group.subnet-rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = true
  performance_insights_enabled = false
  backup_retention_period      = 1
  backup_window                = "00:00-00:30"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}