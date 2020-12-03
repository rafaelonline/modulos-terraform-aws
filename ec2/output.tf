output instance_id  {
  description = "List of IDs of instances"
  value       = join("", aws_instance.default.*.id)
}

output private_ip {
  value = join("",aws_instance.default.*.private_ip)
}