resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Env  = var.ambiente
    Name = var.vpc_name
    Owner = var.owner
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Env  = var.ambiente
    Name = "IGW Default"
    Owner    = var.owner
  }
}

resource "aws_default_route_table" "public_default" {
  default_route_table_id = aws_vpc.default.default_route_table_id

    lifecycle {
    create_before_destroy = true
  }

  tags = {
    Env  = var.ambiente
    Name = "RT Default"
    Owner    = var.owner
  }
}

resource "aws_route" "public_default" {
  route_table_id         = aws_default_route_table.public_default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.default.id

    lifecycle {
    create_before_destroy = true
  }

  tags = {
    Env  = var.ambiente
    Name = "SG Default"
    Owner    = var.owner
  }
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default.id
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
  security_group_id = aws_default_security_group.default.id
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.default.default_network_acl_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Env  = var.ambiente
    Name = "NACL Default"
    Owner    = var.owner

  }
}

resource "aws_network_acl_rule" "ingress" {
  egress         = false
  rule_number    = 100
  rule_action    = "allow"
  from_port      = 0
  to_port        = 65535
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
  network_acl_id = aws_default_network_acl.default.id
}

resource "aws_network_acl_rule" "egress" {
  egress         = true
  rule_number    = 100
  rule_action    = "allow"
  from_port      = 0
  to_port        = 65535
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
  network_acl_id = aws_default_network_acl.default.id
}