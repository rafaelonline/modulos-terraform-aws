output key_name {
  value = join("", aws_key_pair.generated.*.id)
  description = "description"
}