output "security_group_id" {
  description = "The security group ID of the ALB"
  value       = join("", aws_security_group.default.*.id)
}