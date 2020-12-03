variable "security_group_name" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC onde estara o recurso"
}

variable "allowed_ports_ingress" {
  type        = list(number)
  description = "List of allowed ingress ports"
  default = []
}

variable "allowed_ports_cidr_ingress" {
  type        = list(number)
  description = "List of allowed ingress ports"
  default = []
}

variable "create_security_group" {
  type        = bool
  description = "Create default Security Group with only Egress traffic allowed"
  default     = true
}

variable "ambiente_instance" {
  type    = string
}

variable "owner" {
  type    = string
}

variable "allowed_security_groups" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "A list of CIDR blocks which are allowed to access the database"
  type        = list(string)
  default     = []
}