variable "ambiente" {
  type = string
}

variable vpc_id {
  description = "ID da VPC onde estara o recurso"
}

variable "igw_id" {
  description = "Internet Gateway ID the public route table will point to (e.g. `igw-9c26a123`)"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones where subnets will be created"
}

variable public_subnets {
  type        = list(string)
  description = "description"
}

variable private_subnets {
  type        = list(string)
  description = "description"
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = true
  description = "Instances launched into a public subnet should be assigned a public IP address"
}