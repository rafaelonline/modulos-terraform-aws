output security_group_id {
  value       = join("", aws_security_group.this.*.id)
  description = "description"
}
