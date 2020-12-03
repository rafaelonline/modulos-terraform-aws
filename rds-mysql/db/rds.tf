resource "aws_db_instance" "homolog_mysql" {
  engine                     = var.engine
  engine_version             = var.engine_version
  identifier                 = var.instance_identifier
  username                   = var.master_username
  password                   = var.password
  instance_class             = var.db_instance
  allocated_storage          = var.volume_size
  storage_type               = var.volume_type
  multi_az                   = var.multi_az
  db_subnet_group_name       = var.subnet_group
  vpc_security_group_ids     = [var.security_group]
  availability_zone          = var.az
  port                       = var.port
  publicly_accessible        = var.public
  parameter_group_name       = var.parameter_group_name
  backup_retention_period    = var.backup_retention
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  storage_encrypted          = var.volume_encrypted
  kms_key_id                 = var.kms_key
  auto_minor_version_upgrade = var.minor_version
  skip_final_snapshot        = var.skip_final_snapshot
  copy_tags_to_snapshot      = var.copy_tags
  deletion_protection        = var.deletion

  tags = {
    Nome     = var.db_name
    ambiente = var.ambiente
  }
}