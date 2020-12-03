resource "aws_vpc_endpoint" "s3" {
  count = var.enable_s3_endpoint ? 1 : 0

  vpc_id       = var.vpc_id
  service_name = data.aws_vpc_endpoint_service.s3[0].service_name

  tags = {
    Env  = var.ambiente
    Name = "VPC Endpoint S3"
    Owner = var.owner
  }
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  count = var.enable_s3_endpoint && var.enable_public_s3_endpoint ? 1 : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = var.route_table_public_id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count = var.enable_s3_endpoint && var.enable_private_s3_endpoint ? 1 : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = var.route_table_private_id
}