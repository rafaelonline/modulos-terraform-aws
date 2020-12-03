output vpc_id {
  value       = aws_vpc.default.id
  description = "description"
}

output igw_id {
  value       = "${aws_internet_gateway.default.id}"
  description = "description"
}
