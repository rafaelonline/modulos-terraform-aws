resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0
  name        = var.security_group_name
  vpc_id      = var.vpc_id
  description = "Control traffic to/from - Managed by Terraform"

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name     = var.security_group_name
    Ambiente = var.ambiente_instance
    Owner    = var.owner
  }
}

resource "aws_security_group_rule" "default_ingress" {
  count             = var.create_security_group ? length(compact(var.allowed_ports_ingress)) : 0
  description = "From allowed SGs"

  type                     = "ingress"
  from_port                = var.allowed_ports_ingress[count.index]
  to_port                  = var.allowed_ports_ingress[count.index]
  protocol                 = "tcp"
  source_security_group_id = element(var.allowed_security_groups, count.index)
  security_group_id        = join("", aws_security_group.this.*.id)
}

resource "aws_security_group_rule" "cidr_ingress" {
  count = var.create_security_group && length(var.allowed_cidr_blocks) > 0 ? 1 : 0
  description = "From allowed CIDRs"

  type              = "ingress"
  from_port         = var.allowed_ports_cidr_ingress[count.index]
  to_port           = var.allowed_ports_cidr_ingress[count.index]
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr_blocks
  security_group_id = join("", aws_security_group.this.*.id)
}

resource "aws_security_group_rule" "egress" {
  count             = var.create_security_group ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = join("", aws_security_group.this.*.id)
}