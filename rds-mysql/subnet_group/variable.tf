variable subnets {
  type        = list(string)
  description = "description"
}

variable name_subnet_group {
  type        = string
  default     = "db_sub_homolog_backend"
  description = "description"
}
