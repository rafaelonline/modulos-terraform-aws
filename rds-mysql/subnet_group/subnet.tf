resource "aws_db_subnet_group" "db_sub_homolog_backend" {
  name       = var.name_subnet_group
  subnet_ids = var.subnets
}