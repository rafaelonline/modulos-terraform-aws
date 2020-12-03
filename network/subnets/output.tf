output public_subnets_id {
  value = aws_subnet.public[*].id
  description = "description"
}

output private_subnets_id {
  value       = aws_subnet.private[*].id
  description = "description"
}

output route_table_public_id {
  value = join("", aws_route_table.public.*.id)
  description = "description"
}

output route_table_private_id {
  value = join("", aws_route_table.private.*.id)
  description = "description"
}