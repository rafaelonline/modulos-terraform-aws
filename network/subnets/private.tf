resource "aws_subnet" "private" {
  count             = signum(length(var.private_subnets)) > 0 ? length(var.availability_zones) : 0
  vpc_id            = var.vpc_id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = element(concat(var.private_subnets, [""]), count.index)

  tags = {
    "Name" = format("Private %s", (element(var.availability_zones, count.index)))
  }
}

resource "aws_route_table" "private" {
  count  = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  tags = {
    "Name" = "Private"
  }
}

resource "aws_route_table_association" "private" {
  count          = signum(length(var.private_subnets)) == 1 ? length(var.availability_zones) : 0
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}