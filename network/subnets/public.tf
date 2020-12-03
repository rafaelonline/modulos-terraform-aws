resource "aws_subnet" "public" {
  count                   = signum(length(var.public_subnets)) > 0 ? length(var.availability_zones) : 0
  vpc_id                  = var.vpc_id
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(concat(var.public_subnets, [""]), count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    "Name" = format("Public %s", (element(var.availability_zones, count.index)))
  }
}

resource "aws_route_table" "public" {
  count  = length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  tags = {
    "Name" = "Public"
  }
}

resource "aws_route" "public" {
  count                  = length(var.public_subnets) > 0 ? 1 : 0
  route_table_id         = join("", aws_route_table.public.*.id)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public" {
  count          = signum(length(var.public_subnets)) == 1 ? length(var.availability_zones) : 0
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}